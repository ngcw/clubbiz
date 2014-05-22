class CreateJoinTableAdministratorClub < ActiveRecord::Migration
  def change
    #create_join_table :administrators, :clubs do |t|
      # t.index [:administrator_id, :club_id]
      # t.index [:club_id, :administrator_id]
    create_table :administrators_clubs, id: false do |t|
      t.belongs_to :administrator
      t.belongs_to :club
    end
  end
end
