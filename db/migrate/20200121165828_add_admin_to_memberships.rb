class AddAdminToMemberships < ActiveRecord::Migration[5.2]
  def change
    add_column :memberships, :admin, :boolean
  end
end
