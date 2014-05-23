class AddAttachmentImage2ToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :image2
    end
  end

  def self.down
    drop_attached_file :events, :image2
  end
end
