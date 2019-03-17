class UserTeamSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :tournaments, serializer: TeamTournamentSerializer
end
