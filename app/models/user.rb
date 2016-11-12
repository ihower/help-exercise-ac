class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :subscribes, :dependent => :destroy
  has_many :subscribe_message, :through => :subscribes, :source => :message
  has_many :likes, :dependent => :destroy
  has_many :like_message, :through => :likes, :source => :message

  def display_name
    self.email.split("@").first
  end

  def posts_count
    # TODO: 請完成我
    self.messages.count + self.comments.count
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

  def short_name
    self.email.split("@").first
  end

end
