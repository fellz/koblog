ThinkingSphinx::Index.define :article, :with => :active_record do
  # fields
  indexes title, :sortable => true
  indexes body
  indexes user.name, :as => :author, :sortable => true

  # attributes
  has user_id, created_at, updated_at
end