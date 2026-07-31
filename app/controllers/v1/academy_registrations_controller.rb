class V1::AcademyRegistrationsController < ApplicationController
  def index; end
  def show; end

  def create
    @academy_registration = AcademyRegistration.new(academy_registration_params)

    if @academy_registration.save
      AcademyMailer.new_registration_email(@academy_registration).deliver_now

      render json: @academy_registration, status: :created
    else
      render json: { error: @academy_registration.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  private

  def academy_registration_params
    params.require(:academy_registration).permit(:full_name, :email, :phone, :has_cdl, :driving_experience)
  end
end
