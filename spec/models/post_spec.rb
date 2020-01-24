# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(email: 'foobar@example.com', first_name: 'foobar', password: 'foobar')
    @post = Post.create(title: 'title123', content: 'text123', user_id: @user.id)
  end

  context 'with valid details' do
    it 'should create a post' do
      expect(@post).to be_valid
    end
  end
end
