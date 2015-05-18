class ExecptionMailer < ActionMailer::Base
  default from: "team@interque.co"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.execption_mailer.notify.subject
  #
  def notify
    @greeting = "Hi"

    mail to: "todd@interque.co"
  end
end
