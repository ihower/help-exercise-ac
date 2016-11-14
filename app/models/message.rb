class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_many :liked_by_users ,:through=>:likes, :source=>:user
  has_many :likes

  has_many :subscribed_by_users ,:through=>:subscriptions, :source=>:user
  has_many :subscriptions

  scope :pending, -> { where( :status => "pending" ) }
  scope :completed, -> { where( :status => "completed" ) }
  scope :within_days, -> (day){ where( ["created_at >= ?", Time.now - day.to_i.days ]) }

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
