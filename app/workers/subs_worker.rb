class SubsWorker
  include Sidekiq::Worker
  
  def perform(cat_ids, article_id)
    article = Article.find(article_id)
    cat_ids.each do |cat_id|
       category = Category.find(cat_id)
       category.subscribers.each do |sub|
         SubscriptionsMailer.subs_email(sub.user, category, article).deliver     
       end
    end  
  end

end