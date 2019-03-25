class BracketSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :node
  # has_many :rounds
  belongs_to :tournament, serializer: TeamTournamentSerializer
end
