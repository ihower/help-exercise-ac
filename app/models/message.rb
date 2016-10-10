class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :likes_users, :through => :likes, :source => :user
  has_many :subscribes, :dependent => :destroy
  has_many :subscribes_users, :through => :subscribes, :source => :user

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

 scope :pending, -> {where( :status => "pending" )}
 scope :completed, -> {where( :status => "completed" )}	 	
 scope :within_days, -> {where( ["created_at >= ?", Time.now - params[:days].to_i.days ] )}

end
