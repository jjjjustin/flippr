class CreateFlips < ActiveRecord::Migration
  def change
    create_table :flips do |t|
      t.text :content
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :flips, :users
    add_index :flips, [:user_id, :created_at]
  end
end
