class ContactController < ApplicationController

  def index
    if request.method == 'GET'
      # flash.clear #this fails Happy Path test
      render
    else
      create
    end
  end

  def email_valid?
   params[:email] =~ /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  end

 def create
    if params[:name].blank? || params[:email].blank? || params[:subject].blank? || params[:body].blank?
      flash[:notice] = "Your message could not be sent. Please make sure you have completed all fields."
      render :index

    elsif !email_valid?
      flash[:notice] = "Please type a valid email address"
      render :index
    else
      if verify_recaptcha()
        MailSender.contact_form(params).deliver
        flash[:success] = "Your email was sent successfully"  
        redirect_to contact_index_path

      else
        flash.delete(:recaptcha_error)
        flash[:recaptcha] = "Are you a human? Please try completing reCaptcha again."
        render :index

      end
    end    
  end
end
