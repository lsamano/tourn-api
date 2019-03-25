class Api::V1::BracketsController < ApplicationController
  def index
    brackets = Bracket.all.map {|bracket| BracketSerializer.new(bracket)}
    # render json: {users: users}
    render json: Bracket.all
  end

  def create
    # byebug
    @bracket = Bracket.create("tournament_id": params["tournament"]["id"])
    @bracket.make_bracket(params["teams"])
    if @bracket.valid?
      render json: { bracket: BracketSerializer.new(@bracket) }, status: :created
    else
      render json: { error: 'failed to create bracket' }, status: :not_acceptable
    end
  end

  # def create
  #   # Store entrant-teams into new array
  #   @tournament = Tournament.find(params[:id])
  #   @bracket = Bracket.create(bracket_params)
  #   if @bracket.valid?
  #     # Store entrants in a new array
  #     teams_array = @tournament.teams.clone
  #
  #     # Takes number of entrants and finds the number of rounds in the tourn
  #     number_of_rounds = Math.log(teams_array.length, 2).ceil
  #
  #     round_number = 1
  #     number_of_rounds.times do
  #       # Create a Round
  #       round = Round.create(
  #         number:round_number, notes:"", best_of:7, tournament:@tournament
  #       )
  #       # Create 4 GameSets
  #       4.times do |x|
  #         game_set = GameSet.create(
  #           round:round,
  #           notes:"",
  #           team1_id: teams_array.delete_at(rand(teams_array.length)),
  #           team2_id: teams_array.delete_at(rand(teams_array.length))
  #         )
  #         # Create 7 matches each?
  #         round1.best_of.times do |x|
  #           Match.create(game_set: game_set, notes:"")
  #         end
  #       end
  #       round_number += 1
  #     end
  #
  #
  #     # Create Round 2
  #     round1 = Round.create(number:1, notes:"", best_of:7, tournament:@tournament)
  #       # Create 4 GameSets
  #     4.times do |x|
  #       game_set = GameSet.create(round:round1, notes:"", team1_id: teams_array.delete_at(rand(teams_array.length)), team2_id: teams_array.delete_at(rand(teams_array.length)))
  #       # Create 7 matches each?
  #       round1.best_of.times do |x|
  #         Match.create(game_set: game_set, notes:"")
  #       end
  #     end
  #
  #     render json: { bracket: @bracket, user: UserSerializer.new(current_user) }, status: :created
  #   else
  #     render json: { error: 'failed to create bracket' }, status: :not_acceptable
  #   end
  # end

  private

  # def bracket_params
  #   params.require(:bracket).permit(:teams)
  # end
end
