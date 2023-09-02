class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :update_posts_counter

  def five_recent_comments
    Comment.order(created_at: :desc).limit(5).includes(:author, :post)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
