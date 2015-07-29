class Message < ActiveRecord::Base
	# 「列出進行中訊息 | 列出一週內進行中的訊息 | 列出所有已完成訊息」
  belongs_to :user

  has_many :comments, :dependent => :destroy

  scope :pending, ->{ where( :status => "pending" )}
  scope :completed, ->{ where( :status => "completed" )}
  scope :days, ->(days){ where( ["created_at >= ?", Time.now - days.to_i.days ] )}

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
