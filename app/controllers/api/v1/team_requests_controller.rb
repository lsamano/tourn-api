class Api::V1::TeamRequestsController < ApplicationController

  def create
    @team_request = TeamRequest.create(team_request_params)
    @team_request.user = current_user
    if @team_request.save
      render json: @team_request, status: :created
    else
      render json: { error: 'failed to send team request', message: @team_request.errors }, status: :not_acceptable
    end
  end

  private

  def team_request_params
    params.require(:team_request).permit(:team_id, :user_id)
  end
end
