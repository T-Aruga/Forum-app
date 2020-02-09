class Board < ApplicationRecord
  belongs_to :user
  
  has_many :comments, dependent: :destroy
  has_many :board_tags
  has_many :tags, through: :board_tags
  
  
  validates :name, presence: true, length: { maximum: 10 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1000 }
end
