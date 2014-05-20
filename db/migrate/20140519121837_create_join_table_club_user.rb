class CreateJoinTableClubUser < ActiveRecord::Migration
  def change
    #create_join_table :clubs, :users do |t|
      # t.index [:club_id, :user_id]
      # t.index [:user_id, :club_id]
    create_table :clubs_users, id: false do |t|
      t.belongs_to :club
      t.belongs_to :user
    end
  end
end
