class PostsController < ApplicationController
  def index
    @post = User.includes(:posts, :comments).find_by(id: params['user_id'])
  end

  def show
    @post = User.find_by(id: params['user_id']).posts.find_by(id: params['id'])
    @comment = Comment.includes(:author).where(post_id: @post)
  end

  def new
    @user = self
  end

  def create
    @values = params[:post]
    @post = Post.new(title: @values['title'], text: @values['text'], author: User.find_by(id: params['user_id']))
    return unless @post.save

    redirect_to "/users/#{params['user_id']}"
  end
end
