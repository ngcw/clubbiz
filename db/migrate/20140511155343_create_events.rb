class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.boolean :memberOnly
      t.datetime :date
      t.string :place
      t.float :price
      t.string :website
      t.string :imagePath
      t.string :bannerPath
      t.string :salesLocation

      t.timestamps
    end
  end
end
