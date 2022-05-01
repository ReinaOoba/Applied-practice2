class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only:[:create, :destroy]

  def create
    current_user.follow(user)
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(user)
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  private

  def set_user
    user = User.find(params[:user_id])
  end
end
