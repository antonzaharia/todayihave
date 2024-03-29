class User < ApplicationRecord
  has_many :posts
  has_many :notifications

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  has_secure_password
end
