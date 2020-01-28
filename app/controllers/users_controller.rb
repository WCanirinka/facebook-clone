# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def index
    @users = User.all
    @friendship = Friendship.new
  end

  def confirm_friend
    friend = User.find(params[:id])
    if current_user.confirm_friend(friend)
      redirect_back fallback_location: current_user, notice: 'You acepted a friendship!'
    else
      redirect_to current_user, alert: 'You can not accept this friend!'
    end
  end

  def decline_friend
    friend = User.find(params[:id])
    request1 = Friendship.where(user_id: friend.id, friend_id: current_user.id).first
    request2 = Friendship.where(user_id: current_user.id, friend_id: friend.id).first
    req = request1 || request2
    req.destroy
    if req.destroy
      redirect_back fallback_location: current_user, notice: 'You declined a frienship!'
    else
      flash[:error] = 'Something went wrong'
    end
  end

  def friends
    @friends = current_user.friends
  end
end
