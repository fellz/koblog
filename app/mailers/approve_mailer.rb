class ApproveMailer < ApplicationMailer
  default from: 'Koblog<robot@koblog.ru>'
  layout "mailer"
  def approve_email(user, article)
    @user_id = user.id
    mail(to: user.email,
         subject: "Ваша статья '#{article.title}' #{article.approved ? 'одобрена': 'не одобрена' }" )
  end
end
