class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :bio, :created_at
  has_many :teams, serializer: UserTeamSerializer

  has_many :hosted_tourns, serializer: TeamTournamentSerializer

  has_many :join_requests, serializer: PendingSentRequestSerializer
end
