class Message < ActiveRecord::Base
  
  has_many :likes, :dependent => :destroy
  has_many :liked_users, :through => :likes, :source => :user

  has_many :subscriptions, :dependent => :destroy
  has_many :subscribed_users, :through => :subscriptions, :source => :user

  scope :pending, -> { where( :status => "pending" ) }
  scope :completed, -> { where( :status => "completed" ) }
  scope :within_days, -> (time) { where( ["created_at >= ?", Time.now - time.to_i.days ] ) }
  
  belongs_to :user

  has_many :comments, :dependent => :destroy

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

  def find_my_like(u)
    if u
      self.likes.where( :user_id => u.id ).first
    else
      nil
    end
  end

  def find_my_subscription(u)
    if u
      self.subscriptions.where( :user_id => u.id ).first
    else
      nil
    end
  end

end
