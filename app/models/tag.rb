class Tag < ApplicationRecord
    has_many :post_tags
    has_many :posts, through: :post_tags

    validates :name, presence: true

    scope :ordered_by_posts, -> { joins(:posts).order('COUNT(posts.id) DESC').group('tags.id') }
end
