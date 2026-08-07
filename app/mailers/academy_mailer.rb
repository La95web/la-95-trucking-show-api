class AcademyMailer < ApplicationMailer
  default from: "Jose Miguel <noreply@la95truckingshow.com>"

  def new_registration_email(registration)
    @registration = registration

    mail(
      to: "la95truckingshow@gmail.com",
      subject: "🔥 Nuevo prospecto para el curso de camioneros"
    )
  end

  def welcome_email(registration)
    @registration = registration

    mail(
      to: @registration.email,
      subject: "Welcome to La 95 Trucking Academy"
    )
  end
end
