class CreateClubAnnouncements < ActiveRecord::Migration
  def change
    create_table :club_announcements do |t|
      t.text :content
      t.integer :club_id
      t.integer :user_id

      t.timestamps
    end
  end
end
