class CreateJoinRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :join_requests do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :team, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
