class User < ApplicationRecord
  has_secure_password
  has_many :admins
  has_many :tournaments, through: :admins
  has_many :hosted_tourns, class_name: "Tournament", foreign_key: :host_id

  has_many :memberships
  has_many :teams, through: :memberships
  has_many :captained_teams, class_name: "Team", foreign_key: :captain_id

  has_many :join_requests
  has_many :requested_teams, through: :join_requests, source: :team

  validates :username, uniqueness: { case_sensitive: false }
end
