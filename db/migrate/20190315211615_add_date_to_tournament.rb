class AddDateToTournament < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :start_dt, :datetime
  end
end
