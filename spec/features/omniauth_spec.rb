# frozen_string_literal: true

require 'rails_helper'

def stub_omniauth
  # first, set OmniAuth to run in test mode
  OmniAuth.config.test_mode = true
  # then, provide a set of fake oauth data that
  # omniauth will use when a user tries to authenticate:
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
    provider: 'facebook',
    uid: '12345678910',
    info: {
      email: 'jesse@mountainmantechnologies.com',
      first_name: 'Jesse',
      last_name: 'Spevack'
    },
    credentials: {
      token: 'abcdefg12345',
      refresh_token: '12345abcdefg',
      expires_at: DateTime.now
    }
  )
end

RSpec.feature 'Omniauths', type: :feature do
  scenario 'using google oauth2' do
    stub_omniauth
    visit root_path
    click_on 'Sign up'
    click_on 'Sign in with Facebook'
    expect(page).to have_text('jesse@mountainmantechnologies.com')
  end
end
