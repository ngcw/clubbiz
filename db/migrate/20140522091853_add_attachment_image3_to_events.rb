class AddAttachmentImage3ToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :image3
    end
  end

  def self.down
    drop_attached_file :events, :image3
  end
end
