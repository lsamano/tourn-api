class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.integer :number
      t.string :notes
      t.integer :best_of
      t.integer :tournament_id

      t.timestamps
    end
  end
end
