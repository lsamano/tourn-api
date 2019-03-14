class CreateHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hosts do |t|
      t.integer :user_id
      t.integer :tournament_id

      t.timestamps
    end
  end
end
