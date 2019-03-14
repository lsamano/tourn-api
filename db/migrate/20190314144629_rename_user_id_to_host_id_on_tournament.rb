class RenameUserIdToHostIdOnTournament < ActiveRecord::Migration[5.2]
  def change
    rename_column :tournaments, :user_id, :host_id
  end
end
