class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy
  scope :within_days,  lambda{ |t| where( ["created_at >= ?", Time.now-t.days ] )}    
  scope :pending, -> {where( :status => "pending" )}
  scope :completed, ->{where( :status => "completed" )}



  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
