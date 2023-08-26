class PostsController < ApplicationController
  before_action :find_user, only: %i[index show]
  before_action :find_post, only: [:show]

  def index
    @posts = @user.posts
  end

  def new
    @post = current_user
    @user = @user.posts.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = 'Post successfully created'
      redirect_to users_path(current_user)
    else
      render 'new'
    end
  end

  def show
    @recent_comments = @post.recent_comments
  end

  def like
    @like = @post.likes.new
    @like.author = current_user
    @like.save
    redirect_to user_post_path(@user, @post)
  end

  def unlike
    @like = @post.likes.find_by(post: @post) # Find the like
    @like&.destroy # Destroy the like if found
    redirect_to user_post_path(@user, @post)
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_post
    @post = @user.posts.find(params[:id])
    return unless @post.nil?

    flash[:alert] = 'Post not found'
    redirect_to user_posts_path(@user)
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
