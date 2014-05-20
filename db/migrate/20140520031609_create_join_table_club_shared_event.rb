class CreateJoinTableClubSharedEvent < ActiveRecord::Migration
  def change
    #create_join_table :clubs, :shared_events do |t|
      # t.index [:club_id, :shared_event_id]
      # t.index [:shared_event_id, :club_id]
    create_table :clubs_shared_events, id: false do |t|
      t.belongs_to :club
      t.belongs_to :shared_event
    end
  end
end
