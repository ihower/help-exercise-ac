class Message < ActiveRecord::Base

  scope :pending, -> {where(:status => "pending")}
  scope :completed, -> {where( :status => "completed" )}


  belongs_to :user

  has_many :comments, :dependent => :destroy

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

  def self.recent(t)
    where(["created_at >= ? ", Time.now-t.to_i.days ])
  end



end
