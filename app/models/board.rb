class Board < ApplicationRecord
  belongs_to :user
  has_many :board_comments, dependent: :destroy

  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true

  #トピック検索用
  def self.look_for(keyword)
    Board.where("title LIKE? OR body LIKE?", "%#{keyword}%", "%#{keyword}%").order(updated_at: :desc)
  end

end
