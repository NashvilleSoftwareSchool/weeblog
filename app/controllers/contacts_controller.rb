class ContactsController < ApplicationController

  def index
    @contact = Contact.new
  end

 def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      if verify_recaptcha() 
        MailSender.contact_form(params[:contact]).deliver
        flash[:success] = "Your email was sent successfully" 
        redirect_to contacts_path
      else
        flash.delete(:recaptcha_error)
        flash[:recaptcha] = "Are you a human? Please try completing reCaptcha again."
        render :index
      end
    else
      flash[:error] = "Your email couldn't be sent. #{@contact.errors.full_messages.join}"
      render :index

    end
  end


end
