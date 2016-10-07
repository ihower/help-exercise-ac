class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  scope :pending, -> { where( :status => "pending" ) }

  scope :completed, -> { where( :status => "completed" ) }

  has_many :subscriptions, dependent: :destroy
  has_many :subscribed_users, through: :subscriptions, source: :user, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user, dependent: :destroy

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
