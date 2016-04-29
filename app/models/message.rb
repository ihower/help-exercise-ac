class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end
  

  scope :pending, -> { where( :status => "pending" ) }
  scope :completed, -> { where( :status => "completed" ) }
  scope :within_days, -> (days){ where( "created_at >= ?", Time.now - 7.days  ) }
  # def pending
  #   self.where( :status => "pending" )
  # end

  # def completed
  #   self.where( :status => "completed" )
  # end

  # def within_days(aaa)
  #   self.where( ["created_at >= ?", Time.now - aaa.to_i.days ] )
  # end
  




end
