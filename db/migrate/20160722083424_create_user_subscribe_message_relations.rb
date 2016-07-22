class CreateUserSubscribeMessageRelations < ActiveRecord::Migration
  def change
    create_table :user_subscribe_message_relations do |t|
      t.integer :user_id
      t.integer :message_id
      t.timestamps null: false
    end
  end
end
