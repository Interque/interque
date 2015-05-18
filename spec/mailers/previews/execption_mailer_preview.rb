# Preview all emails at http://localhost:3000/rails/mailers/execption_mailer
class ExecptionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/execption_mailer/notify
  def notify
    ExecptionMailer.notify
  end

end
