class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :bio
  has_many :admins
  has_many :tournaments
end
