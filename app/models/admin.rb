class Admin < ApplicationRecord
  belongs_to :user
  belongs_to :tournament

  validates_uniqueness_of :user_id, scope: :tournament_id
end
