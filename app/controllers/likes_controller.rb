class LikesController < ApplicationController
  before_action :find_post

  def create
    @like = @post.likes.build(user: current_user)
    if @like.save
      redirect_to user_post_path(@post.author, @post), notice: 'Liked post!'
    else
      redirect_to user_post_path(@post.author, @post), alert: 'Error liking post.'
    end
  end

  def destroy
    @like = @post.likes.find_by(user: current_user)
    @like&.destroy
    redirect_to user_post_path(@post.author, @post), notice: 'Unliked post.'
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
