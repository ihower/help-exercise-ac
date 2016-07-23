class Message < ActiveRecord::Base

  belongs_to :user
  has_many :subscriptions
  has_many :likes
  has_many :liked_users, :through => :likes, :source => :user
  has_many :subscript_users, :through => :subscriptions, :source => :user

  has_many :comments, :dependent => :destroy

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end
  
  scope :pending, -> { where( :status => "pending" ) }
  scope :completed, -> { where( :status => "completed" ) }
  
  def self.within_days(t=Time.now)
    where("created_at >= ?", t)
  end

end
