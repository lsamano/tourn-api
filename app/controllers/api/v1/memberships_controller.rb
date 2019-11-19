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

  def delete_by_team
    @team = Team.find(params[:team_id])
    @membership = current_user.memberships.find { |membership| membership.team_id == @team.id }
    @membership.destroy
    render json: { team: TeamSerializer.new(@team), user: UserSerializer.new(current_user) }, status: :accepted
  end

  private
  def membership_params
    params.require(:membership).permit(:user_id, :team_id)
  end

end
