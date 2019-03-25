class CreateNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.integer :team_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
