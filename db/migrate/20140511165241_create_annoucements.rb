class CreateAnnoucements < ActiveRecord::Migration
  def change
    create_table :annoucements do |t|
      t.text :content
      t.datetime :dateAdded
      t.integer :user

      t.timestamps
    end
  end
end
