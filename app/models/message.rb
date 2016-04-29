class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_many :likes
  has_many :like_users, :through => :likes, :source => :user

  has_many :subscriptions
  has_many :subscription_users, :through => :subscriptions, :source => :user

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

  scope :pending, -> { where( :status => "pending" ) } 
  scope :completed, -> { where( :status => "completed" ) } 
  scope :within_days, -> (within_days) { where( ["created_at >= ?", Time.now - within_days.to_i.days ]) }
  	
end
