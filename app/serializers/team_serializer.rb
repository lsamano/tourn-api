class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :tagline, :created_at, :logo
  belongs_to :captain, serializer: TeamUserSerializer
  has_many :tournaments, serializer: TeamTournamentSerializer
  has_many :members, serializer: TeamUserSerializer
  has_many :join_requests
end
