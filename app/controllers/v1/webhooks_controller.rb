require "square"
require "square_legacy"
require "resend"

class V1::WebhooksController < ApplicationController
  def receive
    require "openssl"
    require "base64"

    event = JSON.parse(request.body.read)

    signature     = request.headers["x-square-signature"]
    body          = request.raw_post
    url           = request.original_url
    signature_key = ENV["SQUARE_WEBHOOK_SIGNATURE_KEY"]

    if signature_key.blank?
      Rails.logger.error("Falta SQUARE_WEBHOOK_SIGNATURE_KEY en ENV")
      return render json: { error: "Server misconfigured" }, status: :internal_server_error
    end

    string_to_sign     = url + body
    computed_signature = Base64.strict_encode64(
      OpenSSL::HMAC.digest("sha1", signature_key, string_to_sign)
    )

    unless Rack::Utils.secure_compare(computed_signature, signature.to_s)
      return render json: { error: "Invalid signature" }, status: :unauthorized
    end

    # ✅ Inicialización correcta del cliente Square
    client = SquareLegacy::Client.new(
      access_token: ENV["SQUARE_ACCESS_TOKEN"],
      environment: "production"
    )

    case event["type"]
    when "payment.created", "payment.updated"

    payment = event["data"]["object"]["payment"]

    # 👉 Solo pagos completados
    unless [ "COMPLETED", "APPROVED" ].include?(payment["status"])
      Rails.logger.info("Payment ignorado con status #{payment['status']}")
      return render json: { success: true }, status: :ok
    end

    customer_id     = payment["customer_id"]
    subscription_id = payment["subscription_id"] || "payment:#{payment['id']}"

    full_name = nil
    email     = nil

    if customer_id.present?
      response = client.customers.retrieve_customer(customer_id: customer_id)

      if response.success?
        customer  = response.data.customer
        full_name = [customer["given_name"], customer["family_name"]].compact.join(" ").presence
        email     = customer["email_address"].presence
      end
    end

    if full_name.blank? || email.blank?
      billing = payment["billing_details"] || {}
      email = billing["email_address"] if email.blank?
      full_name = billing["name"] if full_name.blank?
    end

    # Fallback solo para test events
    if email.blank? && (Rails.env.development? || Rails.env.test?)
      email = "luissanteliz22@gmail.com"
      full_name = "luis santeliz"
      Rails.looger.info("Test event: usando email y nombre de prueba")
    end

    if email.blank?
      Rails.logger.error("Payment #{payment['id']} sin email — webhook abortado")
      return render json: { success: true }, status: :ok
    end

    existing = Subscriptor.find_by(square_subscription_id: subscription_id)
    return render json: { success: true }, status: :ok if existing

    qr_id = Subscriptor.generate_qr_id
    subscriptor = Subscriptor.create!(
      full_name: full_name,
      email: email,
      qr_id: qr_id,
      status: :active,
      square_subscription_id: subscription_id
    )

    Rails.logger.info("Subscriptor creado: #{subscriptor.id} / #{email} desde #{event['type']}")

    # ✅ Enviar correo con Resend
    Resend.api_key = ENV["API_KEY_RESEND"]

    html_content = <<~HTML
      <div style="font-family: Arial, sans-serif; padding: 20px; color: #333; text-align: center; background-color:#f9f9f9; border:1px solid #ddd; border-radius:8px;">
        <h2 style="color: #007BFF; margin-bottom: 20px;">Confirmación de compra</h2>
        <p style="font-size:14px; margin:10px 0;"><strong>Subscripción ID:</strong> #{qr_id}</p>
        <p style="font-size:14px; margin:10px 0;">Preséntalo en digital en las empresas afiliadas</p> 
        <ul style="display:inline-block; text-align:left; font-size:13px; line-height:1.5; margin:20px auto; padding-left:20px;">
          <li>Este código QR es la confirmación de tu compra, consérvalo contigo</li>
          <li>Preséntalo en digital o impreso en las empresas afiliadas.</li>
        </ul>   
        <p style="margin-top:20px; font-size:14px;">Gracias por preferirnos.</p> 
        <div style="margin-top:20px;">
          <a href="https://la-95-trucking-show-api-production.up.railway.app/v1/subscriptors/#{qr_id}/qr.png" 
            style="display:inline-block; padding:12px 20px; background-color:#007BFF; color:#fff; text-decoration:none; border-radius:5px; font-weight:bold;">
            Abrir QR aquí
          </a>
        </div>
      </div>
    HTML

    begin
        response = Resend::Emails.send({
        from: "La95 Trucking Show <noreply@la95truckingshow.com>",
        to: email,
        subject: "Confirmación de compra - La95 Trucking Show",
        html: html_content
      })
      Rails.logger.info("Correo enviado a #{response.inspect}")
    rescue => e
      Rails.logger.error("Error enviando correo con Resend: #{e.message}")
    end

    Rails.logger.info("Webhook procesado: Subscriptor #{subscriptor.id} creado con QR #{qr_id}")

    when "subscription.updated"
      sub_data = event["data"]["object"]["subscription"]
      subscription_id = sub_data["id"]
      subscriptor = Subscriptor.find_by(square_subscription_id: subscription_id)

      if subscriptor && sub_data["canceled_date"].present?
        canceled_date = Date.parse(sub_data["canceled_date"])
        today = Date.today

        status = if canceled_date > today
          :scheduled_cancellation
        else
          :canceled
        end
      begin
      subscriptor.update!(status: status)
      Rails.logger.info("Subscriptor #{subscriptor.id} actualizado: status #{status}")
      rescue => e
        Rails.looger.error("Error actualizado Subscriptor #{subscriptor.id}: #{e.message}")
      end

      else
        # 👉 Ignorar otros eventos
        return render json: { ignored: true }, status: :ok
      end
      render json: { success: true }, status: :ok
    end
  end
end
