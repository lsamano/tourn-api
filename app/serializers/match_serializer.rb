class MatchSerializer < ActiveModel::Serializer
  attributes :id, :notes, :winner_id, :game_set_id
end
