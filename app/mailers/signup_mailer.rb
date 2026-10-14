class SignupMailer < ActionMailer::Base
  default from: "no-reply@colcho.net"

  def confirm_email(user)
    @user = user
    @confirmation_link = confirmations_url(token: @user.confirmation_token)

    mail({
      to: user.email,
      bcc: [ "sign ups <signups@colcho.net>" ],
      subject: t("signup_mailer.confirm_email.subject")
    })
  end
end
