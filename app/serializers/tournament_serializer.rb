class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  belongs_to :host
  has_many :admin_users
end
