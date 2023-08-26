class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  before_create :comment_counter
  after_destroy :comment_counter

  # comments counter
  def comment_counter
    post.update(comments_counter: post.comments.all.length)
  end
end
