class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.boolean :memberOnly
      t.datetime :date
      t.string :place
      t.float :price
      t.string :website
      t.string :salesLocation
      t.string :description
      t.string :termsConditions
      t.integer :total_tickets
      t.timestamps
      
    end
  end
  
end
