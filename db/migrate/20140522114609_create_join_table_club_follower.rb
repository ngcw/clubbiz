class CreateJoinTableClubFollower < ActiveRecord::Migration
  def change
    #create_join_table :clubs, :followers do |t|
      # t.index [:club_id, :follower_id]
      # t.index [:follower_id, :club_id]
    create_table :clubs_followers, id: false do |t|
      t.belongs_to :club
      t.belongs_to :follower
    end
  end
end
