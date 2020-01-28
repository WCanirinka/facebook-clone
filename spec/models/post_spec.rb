# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    text = 'The Teams page contains a listing of the various Community Teams,
            their responsibilities, links to their Wiki Home Pages and leaders,
            communication tools, and a quick reference to let you know whether
            Most Teams’ Wiki Home Pages provide information about who they are,
            what they do, when their meetings are, and how to contact them.
            Using these pages, teammates are able to communicate and
            LooTeamsFor participating on the Country area team contributing to
            a Local Development of Localization and Internationalization and
            Like most communities, we have our rules and governing body.
            Anyone can join and participate in most, if not all, of our Teams
            and Projects. But if you want an “@ubuntu.com” e-mail address, it
            has to be earned. Find out how in our Membership section.
            As an active member of our community, you probably should check out
            what else is going on in the world of Ubuntu:
            The Fridge posts all the latest News and Upcoming Events.
            Planet Ubuntu is a collection of community blogs.
            If you are interested in getting to know other Ubuntu users or
            seeing a list of Ubuntu teams outside the general Ubuntu world,
            check out our social network page. '

    @user = User.create(email: 'foobar@example.com', first_name: 'foobar', password: 'foobar')
    @post = Post.create(title: 'title123', content: 'text123', user_id: @user.id)
    @post2 = Post.create(title: 'title123', content: text, user_id: @user.id)
  end

  context 'with valid details' do
    it 'should create a post' do
      expect(@post).to be_valid
    end
  end

  context 'with invalid details' do
    it 'should throw error for content length' do
      expect(@post2).to be_invalid
    end
  end
end
