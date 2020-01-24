# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(email: 'foobar@example.com', first_name: 'foobar', password: 'foobar')
  end

  context 'with valid details' do
    it 'should create a user' do
      expect(@user).to be_valid
    end
  end
end
