class FriendshipsController < ApplicationController
  def index
    @requests = current_user.friend_requests
  end

  def create
    count = Friendship.where(user_id: current_user.id, friend_id: params[:friendship][:user_id]).count ||
            Friendship.where(friend_id: current_user.id, user_id: params[:friendship][:user_id]).count
    @friendship = current_user.friendships.build(friend_id: params[:friendship][:user_id]) if count.zero?
    if @friendship&.save
      flash[:success] = 'Friend request succesfully sent'
      redirect_to users_path, notice: 'You just sent a request'
    else
      redirect_to users_path, notice: 'Friendship request already exists'
    end
  end
end
