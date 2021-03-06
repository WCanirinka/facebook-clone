# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :postlikes, foreign_key: 'user_id'
  has_many :commentlikes, foreign_key: 'user_id'
  has_many :plikes, through: :postlikes, source: :post
  has_many :clikes, through: :commentlikes, source: :comment
  has_many :friendships
  has_many :friends, -> { where(friendships: { status: 'accepted' }).order('first_name DESC') },
           through: :friendships
  has_many :requested_friends, -> { where(friendships: { status: 'requested' }).order('created_at DESC') },
           through: :friendships, source: :friend
  has_many :pending_friends, -> { where(friendships: { status: 'pending' }).order('created_at DESC') },
           through: :friendships, source: :friend
  before_save :downcase_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :omniauthable, omniauth_providers: %i[facebook]

  def downcase_email
    self.email = email.downcase
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.first_name = auth.info.name
      user.password = Devise.friendly_token[0, 20]
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info'])
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def postlike(post)
    plikes << post
  end

  def postunlike(post)
    plikes.delete(post)
  end

  def liked_post?(post)
    plikes.include?(post)
  end

  def commentlike(comment)
    clikes << comment
  end

  def commentunlike(comment)
    clikes.delete(comment)
  end

  def liked_comment?(comment)
    clikes.include?(comment)
  end
end
