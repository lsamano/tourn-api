class TeamRequest < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates_uniqueness_of :team_id, scope: :user_id

  # Need validation for verifying that you're not already on the team
end
