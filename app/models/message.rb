class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_many :user_like_message_relations
  has_many :liked_users, :through => :user_like_message_relations, :source => :user

  has_many :user_subscribe_message_relations
  has_many :subscribed_users, :through => :user_subscribe_message_relations, :source => :user




  scope :pending, -> { where( :status => "pending" ) }
  scope :completed, -> { where( :status => "completed" ) }
  scope :within_days, ->(before_days) { where( ["created_at >= ?", Time.now - before_days.days ] ) }




  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
