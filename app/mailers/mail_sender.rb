class MailSender < ActionMailer::Base
	
  def contact_form(params)
		@name = params[:name]
		@email = params[:email]
		@subject = params[:subject]
		@body = params[:body]
		mail(:to => 'ben2d2@gmail.com, marilyn.j.franklin@gmail.com', :from => @email, :subject => @subject, :body => @body)
 	
  end
end
