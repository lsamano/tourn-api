class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :team_id
      t.integer :tournament_id
      t.integer :placement

      t.timestamps
    end
  end
end
