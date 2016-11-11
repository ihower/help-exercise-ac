class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :message_id

      t.timestamps null: false
    end
    add_index :subscriptions, :user_id
    add_index :subscriptions, :message_id
  end
end
