class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  scope :pending, -> { where( :status => "pending" ) } 
  scope :completed, -> { where( :status => "completed" ) } 
  scope :within_days, ->(num) { where( "created_at >= ?", Time.now - num.days ) } 

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
