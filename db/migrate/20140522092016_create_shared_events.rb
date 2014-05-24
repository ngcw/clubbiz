class CreateSharedEvents < ActiveRecord::Migration
  def change
    create_table :shared_events do |t|
      # Associations
      t.belongs_to :events
      t.belongs_to :clubs

      # Table Fields
      t.integer :eventId
      t.integer :clubId
      t.boolean :approved
      t.timestamps
    end
  end
end
