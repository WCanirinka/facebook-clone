# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe 'UsersSignups', type: :request do
  describe 'GET /users_signup' do
    before :each do
      @user = User.create(email: 'user@example.com', password: 'password')
    end

    it 'Successful Signup' do
      get new_user_registration_path
      post '/users', params: { user: { email: 'user2@example.com',
                                       password: 'password', password_confirmation: 'password' } }
      expect(response).to redirect_to(root_path)
    end

    it 'Failed Signup' do
      get new_user_registration_path
      post '/users/sign_in', params: { user: { email: 'user@example.com', password: '', password_confirmation: '' } }
      expect(response).to_not redirect_to(root_path)
    end
  end
end
