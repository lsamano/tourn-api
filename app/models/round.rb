class Round < ApplicationRecord
  belongs_to :tournament
  has_many :game_sets
end
