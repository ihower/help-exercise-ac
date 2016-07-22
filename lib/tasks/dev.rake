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

    20.times do
      m = Message.create!( :title => Faker::Lorem.word,
                           :status => ["pending", "completed"].sample,
                           :content => Faker::Lorem.paragraph,
                           :user => users.sample,
                           :created_at => Time.now - rand(30).days )
      5.times do
        m.comments.create!( :content => Faker::Lorem.paragraph,
                            :user => users.sample )
      end

      i = 0
      until i > 1 do
        user = User.all.sample
        subscription = m.find_my_subscription(user)
        unless subscription
          Subscription.create!( :message_id => m.id, :user_id => user.id )
        i += 1
        end
      end

      i = 0
      until i > 1 do
        user1 = User.all.sample
        like = m.find_my_like(user1)
        unless like
          Like.create!( :message_id => m.id, :user_id => user1.id )
        i += 1
        end
      end

    end
  end

end