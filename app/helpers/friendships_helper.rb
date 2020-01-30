# frozen_string_literal: true

module FriendshipsHelper
  # Return an appropriate friendship status message.
  def friendship_status(user, friend)
    friendship = Friendship.find_by_user_id_and_friend_id(user, friend)
    return "#{friend.first_name} is not your friend (yet)." if friendship.nil?

    case friendship.status
    when 'requested'
      "#{friend.first_name} would like to be your friend."
    when 'pending'
      "You have requested friendship from #{friend.first_name}."
    when 'accepted'
      "#{friend.first_name} is your friend."
    end
  end
end
