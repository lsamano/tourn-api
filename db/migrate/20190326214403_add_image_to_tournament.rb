class AddImageToTournament < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :image, :string
  end
end
