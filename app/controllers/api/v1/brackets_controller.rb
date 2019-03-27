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
      render json: @bracket.tournament, status: :created
    else
      render json: { error: 'failed to create bracket' }, status: :not_acceptable
    end
  end

  private

  # def bracket_params
  #   params.require(:bracket).permit(:teams)
  # end
end
