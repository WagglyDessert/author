class HomeController < ApplicationController
  def index
    @contact = Contact.new
  end

  def submit_contact
    @contact = Contact.new(contact_params)

    if send_contact_email(@contact)
      flash[:notice] = "Your message has been submitted. Thank you!"
      redirect_to root_path(anchor: 'contact')
    else
      flash[:alert] = "There was an issue sending your message. Please try again."
      redirect_to root_path(anchor: 'contact')
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :message)
  end

  def send_contact_email(contact)
    # Assuming you're using ActionMailer to send the email via SendGrid
    begin
      ContactMailer.contact_form(contact).deliver_now
      true
    rescue StandardError => e
      Rails.logger.error("Failed to send email: #{e.message}")
      false
    end
  end
end
#   def submit_contact
#     @contact = Contact.new(contact_params)

#     if @contact.save
#       flash[:notice] = "Your message has been submitted. Thank you!"
#       redirect_to root_path(anchor: 'contact')
#     else
#       flash[:alert] = "Please fill out all required fields."
#       redirect_to root_path(anchor: 'contact')
#     end
#   end

#   private

#   def contact_params
#     params.require(:contact).permit(:first_name, :last_name, :email, :message)
#   end

# end
