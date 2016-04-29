class Message < ActiveRecord::Base
  scope :pending, → { where( :status => "pending" ) }
  scope :completed, → { where( :status => "completed" ) 
  scope :foobar, ->(days) { where( 'created_at >= ?', Time.now-7.days) }

  belongs_to :user

  has_many :comments, :dependent => :destroy

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
