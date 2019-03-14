class AddUserIdToTournaments < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :user_id, :integer 
  end
end
