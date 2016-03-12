module ArticlesHelper
  def select_categories
    Category.all
  end
  def send_emails(cat_ids, article)
    cat_ids.each do |cat_id|
       c = Category.find(cat_id)
       c.subscribers.each do |user|
         SubscriptionsMailer.subs_email(user.id, cat_id, user.email, article).deliver     
       end
    end     
  end
end
