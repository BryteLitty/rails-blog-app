class PostsController < ApplicationController
  def index
    @user_id = params[:id]
  end

  def show
    @post_id = params[:post_id]
  end
end
