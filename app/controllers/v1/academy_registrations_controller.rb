class V1::AcademyRegistrationsController < ApplicationController
  def index; end
  def show; end

  def create
    @academy_registration = AcademyRegistration.new(academy_registration_params)

    if @academy_registration.save
      # Disparamos el correo de notificación
      AcademyMailer.new_registration_email(@academy_registration).deliver_now

      render json: @academy_registration, status: :created
    else
      # Respondemos con el error en el mismo formato que tu otro controlador
      render json: { error: @academy_registration.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  private

  def academy_registration_params
    # Permitimos los parámetros usando los nombres de las columnas de la base de datos
    params.require(:academy_registration).permit(:full_name, :email, :phone, :has_cdl, :driving_experience)
  end
end
