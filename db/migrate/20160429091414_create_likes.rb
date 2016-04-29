class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id, :integer, :index => true
      t.integer :message_id, :integer, :index => true
      t.timestamps null: false
    end
  end
end
