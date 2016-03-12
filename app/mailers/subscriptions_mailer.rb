class SubscriptionsMailer < ApplicationMailer
  default from: 'Koblog<robot@koblog.ru>'

  def subs_email(user_id, category_id, user_email, article, )
    @user_id = user_id
    @category_id = category_id
    @user_email = user_email
    @article = article
    mail(to: @user_email,
         subject: "Новая статья в #{@category.name}")
  end
end
