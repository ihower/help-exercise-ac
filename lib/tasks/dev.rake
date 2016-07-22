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
      2.times do
        user = User.all.sample
        subscription = m.find_my_subscription(user)
        unless subscription
          Subscription.create!( :message => @message, :user => user )
        end
      end
      2.times do
        user = User.all.sample
        like = m.find_my_like(user)
        unless like
          Like.create!( :message => @message, :user => user )
        end
      end
    end
  end

end