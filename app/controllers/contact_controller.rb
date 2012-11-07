class ContactController < ApplicationController

  def index
    if request.method == 'GET'
      render
    else
      create
    end
  end


 def create
    if params[:from].blank? || params[:subject].blank? || params[:message].blank?
      flash[:notice] = "Your message could not be sent. PLease make sure you have completed all fields."
      render :index
    else
    MailSender.contact_form(params).deliver
      flash[:success] = "Your email was sent successfully"  
      redirect_to contact_index_path
    end    
  end
end
