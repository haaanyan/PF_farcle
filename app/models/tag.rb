class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy
  has_many :post_images, through: :tag_maps
end
