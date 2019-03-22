class CreateBrackets < ActiveRecord::Migration[5.2]
  def change
    create_table :brackets do |t|
      t.integer :tournament_id
      t.timestamps
    end
  end
end
