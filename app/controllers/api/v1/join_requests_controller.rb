class Api::V1::JoinRequestsController < ApplicationController

  def create
    @join_request = JoinRequest.create(join_request_params)
    @join_request.user = current_user
    if @join_request.save
      render json: @join_request, status: :created
    else
      render json: { error: 'failed to send join request', message: @join_request.errors }, status: :not_acceptable
    end
  end

  private

  def join_request_params
    params.require(:join_request).permit(:team_id, :user_id)
  end
end
