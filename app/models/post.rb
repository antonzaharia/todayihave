class Post < ApplicationRecord
  belongs_to :user

  validates_uniqueness_of :title, conditions: -> { where('DATE(created_at) = ?', Date.today) }, message: 'has already been taken today'
  validates :title, presence: true
  validates :content, presence: true
end
