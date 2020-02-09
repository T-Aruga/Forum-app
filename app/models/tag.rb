class Tag < ApplicationRecord
  has_many :board_tags, dependent: :delete_all
  has_many :boards, through: :board_tags
end
