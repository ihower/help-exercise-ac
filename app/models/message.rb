class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

  scope :pending, -> { where( status: "pending" ) }
  scope :completed, -> { where( status: "completed" ) }
  scope :within_days, ->(time) { where("created_at >= ?", Time.now - time.days) }
  # According to rails api,here I quote,"Using a class method is the preferred way to accept arguments for scopes."
  # def self.within_days(time)
  #   where( ["created_at >= ?", Time.now - time.days ] )
  # end
end
