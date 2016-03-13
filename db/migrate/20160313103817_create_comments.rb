class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.string :ancestry
      t.index :ancestry
      t.timestamps null: false

    end
  end
end
