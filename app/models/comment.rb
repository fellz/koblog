class Comment < ActiveRecord::Base
  belongs_to :article
  has_ancestry orphan_strategy: :destroy

end
