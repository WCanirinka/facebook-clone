# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true, length: { maximum: 140 }
  has_many :comments, dependent: :destroy
  has_many :postlikes, dependent: :destroy
end
