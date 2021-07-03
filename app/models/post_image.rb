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

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.post_image_tags.delete Tag.find_by(tag_name: new)
    end

    new_tags.each do |new|
      new_post_image_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_image_tag
    end
  end
end
