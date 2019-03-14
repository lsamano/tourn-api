class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :logo
      t.string :name
      t.string :tagline
      t.integer :captain_id

      t.timestamps
    end
  end
end
