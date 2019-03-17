class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_dt
  belongs_to :host

  has_many :entries
  has_many :teams, through: :entries

  has_many :admin_users
end
