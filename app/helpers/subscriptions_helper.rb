module SubscriptionsHelper
  def subscribed? user, category
    puts user,category
    s = Subscription.where("user_id =? AND category_id =? ", user, category)
    if !s.empty?
      return true
    else
      return false
    end   
  end
end
