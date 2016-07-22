class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_many :subscriptions, :dependent => :destroy
  has_many :subscribed_users, :through => :subscriptions, :source => :user



  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

  scope :pending, -> { where( :status => "pending" ) }
  scope :completed, -> {where( :status => "completed" )}

  def self.within_days(params)
  	where( ["created_at >= ?", Time.now - params.days ] )
  end
end
