class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates_uniqueness_of :title, conditions: -> { where('DATE(created_at) = ?', Date.today) }, message: 'has already been taken today'
  validates :title, presence: true
  validates :content, presence: true
  validates :tags, presence: true

  def send_notifications_to_mentions
    content.scan(/@([a-zA-Z0-9_]+)/) do |match|
      user = User.find_by(username: match[0])
      if user.present?
        user.notifications.create(post: self)
      end
    end
  end
end
