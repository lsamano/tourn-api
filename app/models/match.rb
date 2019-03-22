class Match < ApplicationRecord
  belongs_to :game_set
  belongs_to :round, through: :game_set
end
