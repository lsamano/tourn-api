class Api::V1::JoinRequestsController < ApplicationController
  skip_before_action :authorized

  def index
    requests = JoinRequest.all
    render json: requests
  end

  def create
    @join_request = JoinRequest.create(
      team_id: params[:join_request][:team_id],
      user_id: current_user.id
    )
    # @join_request.user = current_user
     # byebug
    if @join_request.save
      render json: { team: TeamSerializer.new(@join_request.team), user: UserSerializer.new(current_user) }, status: :created
    else
      render json: { error: 'failed to send join request', message: @join_request.errors }, status: :not_acceptable
    end
  end

  # When a captain accepts a join request from someone
  def approve_join_request
    join_request = JoinRequest.find(params[:id])
    team = join_request.team
    # Only authorize the captain to do this
    if current_user.id == team.captain_id
      membership = Membership.create(
        team_id: join_request.team_id,
        user_id: join_request.user_id,
        admin: false
      )
      if membership.valid?
        join_request.destroy
        render json: {
          team: TeamSerializer.new(team),
          user: UserSerializer.new(current_user)
          }, status: :accepted
      else
        # invalid request
        render json: {
          message: "Invalid request",
          errors: membership.errors.full_messages
        }, status: :not_acceptable
      end
    else
      render json: { message: "Only the captain is allowed to accept join requests"}, status: :not_acceptable
    end
  end

  private

  def join_request_params
    params.require(:join_request).permit(:team_id, :user_id)
  end
end
