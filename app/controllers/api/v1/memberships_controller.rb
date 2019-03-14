class Api::V1::MembershipsController < ApplicationController
  def index
    render json: {memberships: Membership.all}
  end

  def create
    @membership = Membership.create(membership_params)
    if @membership.valid?
      render json: { membership: @membership }, status: :created
    else
      render json: { error: 'Failed to create Membership' }, status: :not_acceptable
    end
  end

  private
  def membership_params
    params.require(:membership).permit(:user_id, :team_id)
  end

end
