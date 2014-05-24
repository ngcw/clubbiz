class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :topic
      t.string :description
      t.integer :event_id

      t.timestamps
    end
  end
end
