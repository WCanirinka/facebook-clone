# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before :each do
    @user = User.create(email: 'foobar1111@example.com', first_name: 'foobar', password: 'foobar')
    @friend = User.create(email: 'foobar2222@example.com', first_name: 'foobar2', password: 'foobar2')
    @friendship = Friendship.create(:user => @user, :friend => @friend, :status => "pending")
  end
  context 'with valid user and friend details' do
    it 'should create a friendship(pending)' do
      expect(@friendship).to be_valid
    end
  end
end
