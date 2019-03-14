class User < ApplicationRecord
  has_secure_password
  has_many :admins
  has_many :tournaments, through: :admins
  has_many :hosted_tourns, class_name: "Tournament", foreign_key: :host_id

  validates :username, uniqueness: { case_sensitive: false }
end
