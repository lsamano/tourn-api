class Api::V1::MembershipsController < ApplicationController
  def index
    render json: {memberships: Membership.all}
  end

  def create
    @membership = Membership.create(membership_params)
    if @membership.valid?
      team = Team.find(@membership.team_id)
      render json: { team: TeamSerializer.new(team), user: UserSerializer.new(current_user) }, status: :accepted
    else
      render json: { error: 'Failed to create Membership' }, status: :not_acceptable
    end
  end

  private
  def membership_params
    params.require(:membership).permit(:user_id, :team_id)
  end

end
