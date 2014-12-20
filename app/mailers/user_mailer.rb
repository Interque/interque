class UserMailer < ActionMailer::Base
  default from: "todd.metheny@gmail.com"
  layout 'mailer'

  def welcome_email
  	@user = user
  	
  end
end
