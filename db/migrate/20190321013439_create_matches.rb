class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :notes
      t.integer :winner_id
      t.integer :game_set_id

      t.timestamps
    end
  end
end
