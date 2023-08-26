class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :likes_counter
  after_destroy :likes_counter

  # likes counter
  def like_counter
    post.update(likes_counter: post.likes.all.length)
  end
end
