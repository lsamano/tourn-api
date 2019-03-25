class NodeSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :team, serializer: NodeTeamSerializer
  has_many :children
end
