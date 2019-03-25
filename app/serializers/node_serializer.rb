class NodeSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :team, serializer: NodeTeamSerializer
  has_many :children
end
