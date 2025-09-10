class ContactMailer < ApplicationMailer
  default from: 'no-reply@example.com'  # Replace with your email or a no-reply email

  def send_contact_email(contact_params)
    @contact_name = contact_params[:name]
    @contact_email = contact_params[:email]
    @contact_message = contact_params[:message]

    # Using SendGrid to send the email
    mail(
      to: 'your-email@example.com',  # Replace with your email address
      subject: "New Contact Form Submission"
    )
  end
end