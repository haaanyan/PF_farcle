class Board < ApplicationRecord
  belongs_to :user
  has_many :board_comments, dependent: :destroy

  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
