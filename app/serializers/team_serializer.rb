class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :captain_id
  has_many :tournaments, serializer: TeamTournamentSerializer
  has_many :members, serializer: TeamUserSerializer
end
