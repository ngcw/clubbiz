class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      
      t.belongs_to :club
      t.belongs_to :user

      t.string :message
      t.boolean :admintoggle
      t.boolean :membertoggle

      t.timestamps
    end
  end
end
