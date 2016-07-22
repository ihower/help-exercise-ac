class Message < ActiveRecord::Base

  scope :status_pending, -> { where( :status => "pending" ) }
  scope :status_completed, -> { where( :status => "completed" ) }
  scope :within_days, ->(days) { where( ["created_at >= ?", Time.now - days.to_i.days ] ) }

  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  has_many :subscriptions
  has_many :subscripted_users, through: :likes, source: :user


  belongs_to :user

  has_many :comments, :dependent => :destroy

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
