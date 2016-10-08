class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_many :likes

  has_many :subscribes

  scope :pending, -> {where(:status => :pending)}

  scope :completed, -> {where(:status => :completed)}

  scope :within_days, -> {where(':status => :created_at?', Time.now - params[:days].to_i.days)}

  #scope :who_like_it, -> {where(:status => :completed)}

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
