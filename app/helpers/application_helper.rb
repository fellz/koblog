module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert-info"
    when :success then "alert-success"
    when :error then "alert-danger"
    when :alert then "alert-warning"
    end
  end
  def article_owner? article
    if current_user
      current_user.id == article.user.id
    end
  end
  def admin?
    if current_user
      !AdminUser.select{|u| u.email == current_user.email}.empty?
    end
  end
end
