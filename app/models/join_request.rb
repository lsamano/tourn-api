class JoinRequest < ApplicationRecord
  belongs_to :user
  belongs_to :team

  # Validates user can only send one join request to team
  validates_uniqueness_of :team_id, scope: :user_id

  # Need validation for verifying that you're not already on the team
end
