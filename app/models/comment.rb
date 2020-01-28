class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :content, presence: true, length: { maximum: 255 } 
  has_many :commentlikes, dependent: :destroy
end
