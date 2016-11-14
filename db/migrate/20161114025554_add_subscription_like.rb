class AddSubscriptionLike < ActiveRecord::Migration
  def change
  	  create_table :likes do |t|

      t.integer :user_id
      t.integer :message_id

      t.timestamps null: false
    	end

    	create_table :subscriptions do |t|

      t.integer :user_id
      t.integer :message_id

      t.timestamps null: false
    	end
  end
end
