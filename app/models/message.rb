class Message < ActiveRecord::Base

  scope :status_pending, -> { where( :status => "pending" ) }
  scope :status_completed, -> { where( :status => "completed" ) }
  scope :within_days, ->(days) { where( ["created_at >= ?", Time.now - days.to_i.days ] ) }

  belongs_to :user

  has_many :comments, :dependent => :destroy

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
