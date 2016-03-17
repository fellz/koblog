ActiveAdmin.register Article do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  member_action :approve, method: :get do
    article = resource
    article.approved = true
    article.save
    ApproveMailer.approve_email(article.user,article).deliver_now
    redirect_to admin_articles_path, notice: "Одобрено"
  end
  
  member_action :unapprove, method: :get do
    article = resource
    article.approved = false
    article.save
    ApproveMailer.approve_email(article.user,article).deliver_later
    redirect_to admin_articles_path, notice: "Отказано"
  end

  index do |article|
    column :id
    column :title
    column :created_at
    column :approved
    actions do |article|
      item "Одобрить", approve_admin_article_path(article), style: "margin-right:10px;"
      item "Отказать", unapprove_admin_article_path(article)
    end
  end
end
