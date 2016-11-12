class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.integer :user_id
      t.integer :message_id
      t.timestamps null: false
    end
    add_index :subscribes, :user_id
    add_index :subscribes, :message_id
  end
end
