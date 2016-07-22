class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :comments

  has_many :user_like_message_relations
  has_many :liked_messages, :through => :user_like_message_relations, :source => :message

  has_many :user_subscribe_message_relations
  has_many :subscribed_messages, :through => :user_subscribe_message_relations, :source => :message


  def display_name
    self.email.split("@").first
  end

  def posts_count
    # TODO: 我完成了
    self.messages.size + self.comments.size
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
