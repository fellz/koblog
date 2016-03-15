ActiveAdmin.register User do
  index do |article|
    column :id
    column :email
    column :created_at
    column :name
    actions
  end
end