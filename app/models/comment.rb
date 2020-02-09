class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :board
  
  validates :name, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 300 }
end
