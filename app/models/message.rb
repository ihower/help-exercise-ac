class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_many :likes
  has_many :liked_users, :through => :likes, :source => :user

  has_many :subscriptions
  has_many :subscribed_users, :through => :subscriptions, :source => :user



  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

  scope :pending, -> { where( :status => "pending") }
  scope :completed, -> { where( :status => "completed") }
  # scope :within_days, -> { |p| where(["created_at >= ?", (Time.now - p.days)]) }

    def self.within_days(p)
        where(["created_at >= ?", (Time.now - p.days)])
    end

      def find_my_like(u)
    if u
      self.likes.where( :user_id => u.id ).first
    else
      nil
    end
  end



end

