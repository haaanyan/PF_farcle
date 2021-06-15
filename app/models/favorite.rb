class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_image

  validates :user_id, presence: true, uniqueness: { scope: :post_image_id }
  validates :post_image_id, presence: true
  validates :user_id, presence: true
end
