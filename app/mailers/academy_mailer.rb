class AcademyMailer < ApplicationMailer
  default from: "Jose Miguel <noreply@la95truckingshow.com>"

  def new_registration_email(registration)
    @registration = registration

    mail(
      to: "la95truckingshow@gmail.com",
      subject: "🔥 Nuevo prospecto para el curso de camioneros'"
    )
  end
end
