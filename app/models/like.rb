class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def like_counter
    post.update(likes_counter: post.likes.all.length)
  end
end
