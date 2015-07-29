class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end


  scope :pending, ->{where(:state=>'pending')}
  scope :completed, ->{where(:state=>'completed')}

  # scope :within_days(params[:days].to_i) , ->where( ["created_at >= ?", Time.now - params[:days].to_i.days ] )

end
