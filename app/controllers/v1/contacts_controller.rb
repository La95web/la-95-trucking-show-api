require "net/http"
require "uri"
require "json"

class V1::ContactsController < ApplicationController
  def create
    recaptcha_token = params[:recaptcha_token]

    unless verify_recaptcha(recaptcha_token)
      return render json: { status: "error", message: "reCAPTCHA falló (posible bot)" }, status: :unauthorized
    end

    name = params[:name]
    email = params[:email]
    message = params[:message]

    ContactMailer.contact_email(name, email, message).deliver_now!

    render json: { status: "ok", message: "Correo enviado correctamente" }
  rescue => e
    render json: { status: "error", message: e.message }, status: :unprocessable_entity
  end

  private

  def verify_recaptcha(token)
    secret_key = ENV["RECAPTCHA_SECRET_KEY"]

    uri = URI.parse("https://www.google.com/recaptcha/api/siteverify")
    response = Net::HTTP.post_form(uri, {
      "secret" => secret_key,
      "response" => token
    })

    result = JSON.parse(response.body)

    # score recomendado: >= 0.5
    result["success"] && result["score"].to_f >= 0.5
  end
end
