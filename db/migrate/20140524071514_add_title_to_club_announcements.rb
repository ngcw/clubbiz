class AddTitleToClubAnnouncements < ActiveRecord::Migration
  def change
    add_column :club_announcements, :title, :string
  end
end
