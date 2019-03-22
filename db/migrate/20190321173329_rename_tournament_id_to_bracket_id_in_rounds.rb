class RenameTournamentIdToBracketIdInRounds < ActiveRecord::Migration[5.2]
  def change
    rename_column :rounds, :tournament_id, :bracket_id
  end
end
