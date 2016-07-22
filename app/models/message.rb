class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_many :likes, :dependent => :destroy
  has_many :likes_by, :through => :likes, :source => :user, :dependent => :destroy

  has_many :subscriptions, :dependent => :destroy
  has_many :subscriptions_by, :through => :likes, :source => :user, :dependent => :destroy

  scope :pending, -> { where status: "pending" }
  scope :completed, -> {where status: "completed" }
  scope :within_days, -> (time){ where "created_at >= ?", Time.now - time.days }

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
