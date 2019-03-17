class AdminSerializer < ActiveModel::Serializer
  attributes :id, :user, :tournament
  belongs_to :user
  belongs_to :tournament
end
