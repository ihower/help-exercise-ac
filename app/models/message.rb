class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_many :likes
  has_many :liked_users, :through => :likes, :source => :message

  has_many :subscriptions
  has_many :subscribed_users, :through => :subscriptions, :source => :message


  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

  scope :pending, -> { where :status => "pending" }
  scope :completed, -> { where :status => "completed" }
  scope :within_days, -> (time) { where "created_at >= ?", Time.now - time.to_i.days }


end
