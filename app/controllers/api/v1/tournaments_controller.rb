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
      Admin.create(user: current_user, tournament: @tournament)
      render json: { tournament: @tournament }, status: :created
    else
      render json: { error: 'failed to create tournament' }, status: :not_acceptable
    end
  end

  def show
    @tournament = Tournament.find(params[:id])
    render json: @tournament
  end

  def update
    @tournament = Tournament.find(params[:id])
    @tournament.assign_attributes(tournament_params)
    if @tournament.valid?
      @tournament.save
      render json: { tournament: TournamentSerializer.new(@tournament), user: UserSerializer.new(current_user) }, status: :accepted

    else
      render json: { error: 'failed to update tournament' }, status: :not_acceptable
    end
  end

  private

  def tournament_params
    params.require(:tournament).permit(:title, :description, :host_id, :start_dt)
  end
end
