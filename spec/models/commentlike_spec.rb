# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Commentlike, type: :model do
  before :each do
    @user = User.create!(email: 'foobar5@example.com', first_name: 'foobar', password: 'foobar')
    @post = Post.create!(title: 'title123', content: 'text123', user_id: @user.id)
    @comment = Comment.create!(content: 'content', user_id: @user.id, post_id: @post.id)
    @commentlike = Commentlike.create(user_id: @user.id, comment_id: @comment.id)
  end

  context 'with valid details' do
    it 'should create a commentlike' do
      expect(@commentlike).to be_valid
    end
  end
end
