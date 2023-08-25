class PostsController < ApplicationController
  before_action :find_user, only: %i[index show]
  before_action :find_post, only: [:show]

  def index
    @posts = @user.posts
  end

  def new; end

  def show; end

  def find_user
    @user = User.find(params[:id])
  end

  def find_post
    @post = @user.posts.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # handle flash
    flash[:alert] = 'Post not found'
    redirect_to user_posts_path
  end
end
