class GameSet < ApplicationRecord
  belongs_to :round
  has_many :matches
end
