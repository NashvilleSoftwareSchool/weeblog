class ContactController < ApplicationController

  def index
    if request.method == 'GET'
      # flash.clear #this fails Happy Path test
      render
    else
      create
    end
  end


 def create
    if params[:name].blank? || params[:email].blank? || params[:subject].blank? || params[:body].blank?
      flash[:notice] = "Your message could not be sent. Please make sure you have completed all fields."
      render :index
    else
    MailSender.contact_form(params).deliver
      flash[:success] = "Your email was sent successfully"  
      redirect_to contact_index_path
    end    
  end
end
