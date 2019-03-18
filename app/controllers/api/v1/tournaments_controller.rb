class Api::V1::TournamentsController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    tournaments = Tournament.all.sort_by { |tourn| tourn[:created_at] }.reverse
    tournaments = tournaments.map {|tourn| TournamentSerializer.new(tourn)}
    render json: {tournaments: tournaments}
  end

  def create
    @tournament = Tournament.create(tournament_params)
    if @tournament.valid?
      render json: { tournament: @tournament }, status: :created
    else
      render json: { error: 'failed to create tournament' }, status: :not_acceptable
    end
  end

  def show
    @tournament = Tournament.find(params[:id])
    render json: @tournament
  end

  private

  def tournament_params
    params.require(:tournament).permit(:title, :description, :host_id)
  end
end
