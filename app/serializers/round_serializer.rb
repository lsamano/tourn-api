class RoundSerializer < ActiveModel::Serializer
  attributes :id, :number, :notes, :best_of
  has_many :game_sets
end
