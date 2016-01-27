class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :comments

  has_many :subscriptions, :dependent => :destroy
  has_many :subscription_messages, :through => :subscription, :source =>:message

  has_many :likes, :dependent => :destroy
  has_many :like_messages, :through => :like, :source =>:message

  def display_name
    self.email.split("@").first
  end

  def posts_count
    self.comments.size + self.messages.size
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
