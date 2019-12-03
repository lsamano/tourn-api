class JoinRequest < ApplicationRecord
  belongs_to :user
  belongs_to :team

  # Validates user can only send one join request to team
  validates_uniqueness_of :team_id, scope: :user_id

  # Need validation for verifying that you're not already on the team
  validate :you_cannot_request_to_join_your_own_team

  def you_cannot_request_to_join_your_own_team
    if self.user.teams.any? { |team| team.id == team_id }
      errors.add(:team_id, "can't be an ID of a team you currently belong to")
    end
  end
end
