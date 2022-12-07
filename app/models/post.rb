class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates_uniqueness_of :title, conditions: -> { where('DATE(created_at) = ?', Date.today) }, message: 'has already been taken today'
  validates :title, presence: true
  validates :content, presence: true
  validates :tags, presence: true
end
