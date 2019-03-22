class BracketSerializer < ActiveModel::Serializer
  attributes :id
  has_many :rounds
end
