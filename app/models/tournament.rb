class Tournament < ApplicationRecord
  # belongs_to :user
  belongs_to :host, class_name: "User", foreign_key: :host_id

  has_many :admins
  # Below is likely working but connectivity was not fully checked
  has_many :admin_users, through: :admins, source: :user

  has_many :entries
  has_many :teams, through: :entries
  has_many :members, through: :teams
end
