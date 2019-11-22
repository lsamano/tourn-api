class DropTeamRequests < ActiveRecord::Migration[5.2]
  def change
    drop_table :team_requests
  end
end
