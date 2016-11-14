class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end


  has_many :likes
  has_many :like_users, :through => :likes, :source => :user

  has_many :subscribes
  has_many :subscribe_users, :through => :subscribes, :source => :user
  

  def finy_like_by(user)
    self.likes.find_by_user_id( user.id )
  end

  def finy_subscribe_by(user)
    self.subscribes.find_by_user_id( user.id )
  end


  scope :pending, -> { where( :status => "pending" ) }
  scope :completed, -> { where( :status => "completed" ) }
  scope :week_day, -> { where( ["created_at >= ?", Time.now - 7 ] )}

end
