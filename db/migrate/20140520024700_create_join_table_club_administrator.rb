class CreateJoinTableClubAdministrator < ActiveRecord::Migration
  def change
    #create_join_table :clubs, :administrators do |t|
      # t.index [:club_id, :administrator_id]
      # t.index [:administrator_id, :club_id]
     create_table :clubs_Administrators, id: false do |t|
      t.belongs_to :club
      t.belongs_to :administrator
    end
  end
end
