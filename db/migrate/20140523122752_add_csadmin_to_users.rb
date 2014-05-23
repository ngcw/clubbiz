class AddCsadminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :csadmin, :boolean
  end
end
