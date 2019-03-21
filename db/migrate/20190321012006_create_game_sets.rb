class CreateGameSets < ActiveRecord::Migration[5.2]
  def change
    create_table :game_sets do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.integer :winner_id
      t.integer :round_id
      t.string :notes

      t.timestamps
    end
  end
end
