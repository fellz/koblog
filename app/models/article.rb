class Article < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :comments, dependent: :destroy
  acts_as_taggable
end
