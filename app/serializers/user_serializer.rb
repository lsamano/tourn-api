class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :bio
  has_many :teams
  has_many :tournaments
  has_many :hosted_tourns
end
