class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def new; end

  def index
    @users = User.all
  end

  def show
    @recent_posts = @user.recent_posts
  end

  def find_user
    @user ||= User.find(params[:id])
    # handle flash
    flash[:alert] = 'User not found'
    redirect_to users_path
  end
end
