class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :comments

  has_many :likes
  has_many :like_messages, :through => :likes, :source => :message

  has_many :subscriptions
  has_many :subscribed_messages, :through => :likes, :source => :message


  def display_name
    self.email.split("@").first
  end

  def posts_count
    # TODO: 請完成我
  end

  def words_count
    count = 0
    self.messages.find_each do |x|
      count += x.title.split(" ").size if x.title
      count += x.content.split(" ").size if x.content
    end

    self.comments.find_each do |x|
      count += x.content.split(" ").size if x.content
    end

    return count
  end

end
