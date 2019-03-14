class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.integer :user_id
      t.integer :tournament_id

      t.timestamps
    end
  end
end
