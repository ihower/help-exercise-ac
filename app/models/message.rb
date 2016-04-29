class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_many :likes
  has_many :like_users, :through => :likes, :source => :user

  has_many :subscriptions
  has_many :subscribed_users, :through => :likes, :source => :user

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

  scope :pending, -> { where(:status => "pending") }
  scope :completed, -> { where(:status => "completed") }
  scope :days, -> { where(["created_at >= ?", Time.now - 7.days]) }

  def finy_like_by(user)
    self.likes.find_by_user_id(user.id)
  end

  def finy_subscription_by(user)
    self.subscriptions.find_by_user_id(user.id)
  end

end
