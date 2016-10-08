class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :comments

  has_many :likes
  has_many :like_messages, :through => :likes, :source => :message

  has_many :subscribes
  has_many :subscribe_messages, :through => :subscribes, :source => :message

  def like_message?(message)
    self.like_messages.include?(message)
  end

  def subscribe_message?(message)
    self.subscribe_messages.include?(message)
  end

  def display_name
    self.email.split("@").first
  end

  def posts_count
    # TODO: 請完成我
    self.messages.size+self.comments.size
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
