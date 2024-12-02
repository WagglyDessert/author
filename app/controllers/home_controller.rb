class HomeController < ApplicationController
  def index
    @contact = Contact.new
  end

  def submit_contact
    @contact = Contact.new(contact_params)

    if @contact.save
      flash[:notice] = "Your message has been submitted. Thank you!"
      redirect_to root_path(anchor: 'contact')
    else
      flash[:alert] = "Please fill out all required fields."
      redirect_to root_path(anchor: 'contact')
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :message)
  end

end
