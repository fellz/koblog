class SubscriptionsMailer < ApplicationMailer
  default from: 'Koblog<robot@koblog.ru>'
  layout "mailer"
  def subs_email(user, category, article )
    @user_id = user.id
    @category_id = category.id
    @article = article
    mail(to: user.email,
         subject: "Новая статья в #{category.name}")
  end
end
