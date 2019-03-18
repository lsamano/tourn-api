class Api::V1::TeamsController < ApplicationController
  skip_before_action :authorized

  def index
    teams = Team.all.map {|team| TeamSerializer.new(team)}
    render json: {teams: teams}
  end

  def create
    @team = Team.create(team_params)
    if @team.valid?
      render json: { team: @team }, status: :created
    else
      render json: { error: 'Failed to create Team' }, status: :not_acceptable
    end
  end

  def show
    @team = Team.find(params[:id])
    render json: @team
  end

  private
  def team_params
    params.require(:team).permit(:logo, :name, :tagline, :captain_id, :members)
  end

end
