class ContactMailer < ApplicationMailer
 default from: "Jose Miguel <noreply@la95truckingshow.com>"

  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message

    mail(
      to: "luissanteliz22@gmail.com",
      subject: "Nuevo mensaje de contacto"
    )
  end
end
