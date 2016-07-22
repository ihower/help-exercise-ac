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

                           users.sample(5).each do |s|
                             Subscription.create!(:user => s, :message => m)
                           end
                           users.sample(5).each do |l|
                             Like.create!(:user => l, :message => m)
                           end

      5.times do
        m.comments.create!( :content => Faker::Lorem.paragraph,
                            :user => users.sample )
      end
    end
  end

end