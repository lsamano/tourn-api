class AddTeamNameToNodes < ActiveRecord::Migration[5.2]
  def change
    add_column :nodes, :name, :string
  end
end
