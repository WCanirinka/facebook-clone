# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe 'UsersLogins', type: :request do
  describe 'GET /users_logins' do
    before :each do
      @user = User.create(email: 'user@example.com', password: 'password')
      @friend = User.create(email: 'user2@example.com', password: 'password')
      @user3 = User.create(id: 3, email: 'user3@example.com', password: 'password')
      @friendship = Friendship.create(user: @user, friend: @friend, status: 'pending')
    end

    it 'Successful Friendship' do
      expect(@friendship).to be_valid
    end

    it 'Successful Friendship' do
      get new_user_session_path
      post '/users/sign_in', params: { user: { email: 'user@example.com', password: 'password' } }
      expect(response).to redirect_to(root_path)
      follow_redirect!
      get users_path
      post '/friendships?friend=3'
      expect(Friendship.find_by_user_id_and_friend_id(@user, '3')).to be_valid
    end
  end
end
