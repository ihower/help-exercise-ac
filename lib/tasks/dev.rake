namespace :dev do

  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate"]
  task :rebuild => ["dev:build" , :fake]
  task :fake => :environment do
    User.delete_all
    Message.delete_all
    Comment.delete_all

    users = []
    users << User.create!( :email => "test@gmail.com",
                             :password => "12345678")
    10.times do
      users << User.create!( :email => Faker::Internet.email,
                             :password => "12345678")
    end

    20.times do
      m = Message.create!( :title => Faker::Lorem.word,
                           :status => ["pending", "completed"].sample,
                           :category_name => ["快報", "求物資", "求救"].sample,
                           :content => Faker::Lorem.paragraph,
                           :user => users.sample,
                           :created_at => Time.now - rand(30).days )
      2.times do
        m.likes.create!( :user => users.sample )
        m.subscriptions.create!( :user => users.sample )
      end
      puts m.title
      5.times do
        m.comments.create!( :content => Faker::Lorem.paragraph,
                            :user => users.sample )
      end
    end
  end

end