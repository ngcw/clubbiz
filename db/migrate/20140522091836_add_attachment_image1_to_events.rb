class AddAttachmentImage1ToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :image1
    end
  end

  def self.down
    drop_attached_file :events, :image1
  end
end
