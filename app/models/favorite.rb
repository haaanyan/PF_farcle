class Favorite < ApplicationRecord
  validates :user_id, presence: true, uniqueness: { scope: :post_image_id }
  validates :post_image_id, presence: true

  belongs_to :user
  belongs_to :post_image
end
