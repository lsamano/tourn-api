class AddNodeIdToBracket < ActiveRecord::Migration[5.2]
  def change
    add_column :brackets, :node_id, :integer
  end
end
