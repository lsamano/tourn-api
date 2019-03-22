class Api::V1::TournamentsController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def bracket
    # CREATE BRACKET
    # Store entrant-teams into new array
    teams_array = @tournament.teams.clone

    # Create Round 1
    round1 = Round.create(number:1, notes:"", best_of:7, tournament:@tournament)
      # Create 4 GameSets
    4.times do |x|
      game_set = GameSet.create(round:round1, notes:"", team1_id: teams_array.delete_at(rand(teams_array.length)), team2_id: teams_array.delete_at(rand(teams_array.length)))
      # Create 7 matches each?
      round1.best_of.times do |x|
        Match.create(game_set: game_set, notes:"")
      end
    end

    # Create Round 2
    round1 = Round.create(number:1, notes:"", best_of:7, tournament:@tournament)
      # Create 4 GameSets
    4.times do |x|
      game_set = GameSet.create(round:round1, notes:"", team1_id: teams_array.delete_at(rand(teams_array.length)), team2_id: teams_array.delete_at(rand(teams_array.length)))
      # Create 7 matches each?
      round1.best_of.times do |x|
        Match.create(game_set: game_set, notes:"")
      end
    end


  end # End of bracket action

  def index
    tournaments = Tournament.all.sort_by { |tourn| tourn[:created_at] }.reverse
    tournaments = tournaments.map {|tourn| TournamentSerializer.new(tourn)}
    render json: {tournaments: tournaments}
  end

  def create
    @tournament = Tournament.create(tournament_params)
    if @tournament.valid?
      # Add Host to Admins List
      Admin.create(user: current_user, tournament: @tournament)
      # Return Tournament and User/Host
      render json: { tournament: @tournament, user: UserSerializer.new(current_user) }, status: :created
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
