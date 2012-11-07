class MailSender < ActionMailer::Base
	
  def contact_form(params)
		@from = params[:from]
		@subject = params[:subject]
		@message = params[:message]
		mail(:to => 'ben2d2@gmail.com', :from => @from, :subject => @subject, :message => @message)
 	
  end
end
