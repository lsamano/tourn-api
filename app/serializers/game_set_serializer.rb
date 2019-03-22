class GameSetSerializer < ActiveModel::Serializer
  attributes :id, :team1_id, :team2_id, :winner_id, :round_id, :notes
  has_many :matches
end
