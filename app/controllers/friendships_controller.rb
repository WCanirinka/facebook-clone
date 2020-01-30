# frozen_string_literal: true

class FriendshipsController < ApplicationController
  include FriendshipsHelper
  before_action :setup_friends

  def new
    @friendship = Friendship.new
  end

  def create
    Friendship.request(@user, @friend)
    flash[:notice] = 'Friend request sent.'
    redirect_to root_path
  end

  private

  def setup_friends
    @user = current_user
    @friend = User.find(params[:friend])
  end
end
