class Category < ActiveRecord::Base
  has_and_belongs_to_many :articles
  has_many :subscribers, foreign_key: "category_id", class_name: "Subscription"
end
