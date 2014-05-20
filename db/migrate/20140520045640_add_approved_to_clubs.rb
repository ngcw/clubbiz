class AddApprovedToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :approved, :boolean
  end
end
