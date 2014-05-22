class CreateSharedEvents < ActiveRecord::Migration
  def change
    create_table :shared_events do |t|
      t.integer :eventId

      t.timestamps
    end
    add_index :shared_events, :eventId,   unique: true
  end
end
