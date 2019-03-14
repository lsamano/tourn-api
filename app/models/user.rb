class User < ApplicationRecord
  has_secure_password
  has_many :admins
  has_many :tournaments
  validates :username, uniqueness: { case_sensitive: false }
end
