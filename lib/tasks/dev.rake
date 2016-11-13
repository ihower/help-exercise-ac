namespace :dev do

  task :fake => :environment do
    User.delete_all
    Message.delete_all
    Comment.delete_all

    users = []
    10.times do
      users << User.create!( :email => Faker::Internet.email,
                             :password => "12345678")
    end
    messages = []
    20.times do
      m = Message.create!( :title => Faker::Lorem.word,
                           :status => ["pending", "completed"].sample,
                           :content => Faker::Lorem.paragraph,
                           :user => users.sample,
                           :created_at => Time.now - rand(30).days )
      messages << m
      5.times do
        m.comments.create!( :content => Faker::Lorem.paragraph,
                            :user => users.sample )
      end
    end

    rand_messages = messages.sample(2)
    rand_users = users.sample(2)
    Like.create!(:user_id => rand_users.first.id.to_i,
                 :message_id => rand_messages.first.id.to_i)
    Like.create!(:user_id => rand_users.second.id.to_i,
                 :message_id => rand_messages.second.id.to_i)

    rand_messages2 = messages.sample(2)
    rand_users2 = users.sample(2)
    Subscription.create!(:user_id => rand_users2.first.id.to_i,
                 :message_id => rand_messages2.first.id.to_i)
    Subscription.create!(:user_id => rand_users2.second.id.to_i,
                 :message_id => rand_messages2.second.id.to_i)

  end

end