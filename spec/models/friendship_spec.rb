# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  @user = User.find(1)
  @friend = User.find(2)
  @friendship = Friendship.create(:user => @user, :friend => @friend, :status => "pending")

  context 'with valid user and friend details' do
    it 'should create a friendship(pending)' do
      expect(@friendship).to be_valid
    end
  end
end
