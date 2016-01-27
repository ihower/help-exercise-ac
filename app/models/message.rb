class Message < ActiveRecord::Base

  scope :pending, -> { where( :status => "pending" ) }
  scope :completed, -> { where( :status => "completed" ) }  
  #scope :within_days, -> { where(["created_at >= ?", Time.now - params[:days].to_i.days ]) }

  def self.within_days(p)
    where(["created_at > ? ", Time.now - p.days ])
  end

  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_many :subscriptions, :dependent => :destroy
  has_many :subscribed_users, :through => :subscriptions, :source => :user

  has_many :likes, :dependent => :destroy
  has_many :liked_users, :through => :likes, :source => :user

 



  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
