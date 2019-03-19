class Api::V1::EntriesController < ApplicationController
  def index
    render json: {entries: Entry.all}
  end

  def create
    @entry = Entry.create(entry_params)
    if @entry.valid?
      # render json: { entry: @entry }, status: :created
      tourn = Tournament.find(@entry.tournament_id)
      render json: { tournament: TournamentSerializer.new(tourn), user: UserSerializer.new(current_user) }, status: :accepted

    else
      render json: { error: 'Failed to create Entry' }, status: :not_acceptable
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:team_id, :tournament_id, :placement)
  end
end
