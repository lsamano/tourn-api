class UserTeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :tagline, :captain_id, :logo
  has_many :tournaments, serializer: TeamTournamentSerializer
end
