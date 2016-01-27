namespace :dev do
  
  task :rebuild=> ["db:drop", "db:setup", :fake]
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
      2.times do  
        Subscription.create!( :user_id => rand(1..User.all.size), :message_id => m.id )
        Like.create!( :user_id => rand(1..User.all.size), :message_id => m.id )
      end  

      5.times do
        m.comments.create!( :content => Faker::Lorem.paragraph,
                            :user => users.sample )
      end
    end
  end

end