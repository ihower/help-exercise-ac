class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_messages, through: :likes, source: :user

  has_many :subscriptions, dependent: :destroy
  has_many :sub_messages, through: :subscriptions, source: :user

	scope :completed, -> { where( :status => "completed" ) }
	scope :pending, -> { where( :status => "pending" ) }
	scope :within_days, -> (date){ where( "created_at >= ?", Time.now - date.days ) }

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
