class JoinRequestSerializer < ActiveModel::Serializer
  attributes :id, :message, :created_at
  belongs_to :user, serializer: TeamUserSerializer
  belongs_to :team, serializer: UserTeamSerializer
end
