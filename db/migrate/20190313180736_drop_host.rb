class DropHost < ActiveRecord::Migration[5.2]
  def change
    drop_table :hosts
  end
end
