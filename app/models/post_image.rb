class PostImage < ApplicationRecord
  belongs_to :user

  attachment :image

  validates :user_id, presence: true
  validates :image, presence: true

  has_many :post_image_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # いいねされたユーザーのデータ取得
  has_many :favorite_users, through: :favorites, source: :user

  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
