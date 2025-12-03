class V1::ContactsController < ApplicationController
  def create
    name = params[:name]
    email = params[:email]
    message = params[:message]

    # Llamamos al mailer
    ContactMailer.contact_email(name, email, message).deliver_now!

    render json: { status: "ok", message: "Correo enviado correctamente" }
  rescue => e
    render json: { status: "error", message: e.message }, status: :unprocessable_entity
  end
end
