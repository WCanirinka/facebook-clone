# frozen_string_literal: true

class FriendshipsController < ApplicationController
  include FriendshipsHelper
  before_action :setup_friends

  def create
    Friendship.request(@user, @friend)
    flash[:notice] = 'Friend request sent.'
    redirect_to user_path(@friend)
  end

  def accept
    if @user.requested_friends.include?(@friend)
      Friendship.accept(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.first_name} accepted!"
    else
      flash[:notice] = "No friendship request from #{@friend.first_name}."
    end
    redirect_to user_path(@friend)
  end

  def decline
    if @user.requested_friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.first_name} declined"
    else
      flash[:notice] = "No friendship request from #{@friend.first_name}."
    end
    redirect_to user_path(@friend)
  end

  def cancel
    if @user.pending_friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = 'Friendship request canceled.'
    else
      flash[:notice] = "No request for friendship with #{@friend.first_name}"
    end
    redirect_to user_path(@friend)
  end

  def delete
    if @user.friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.first_name} deleted!"
    else
      flash[:notice] = "You aren't friends with #{@friend.first_name}"
    end
    redirect_to user_path(@friend)
  end

  private

  def setup_friends
    @user = current_user
    @friend = User.find(params[:id])
  end
end
