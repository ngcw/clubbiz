class CreateReserveTickets < ActiveRecord::Migration
  def change
    create_table :reserve_tickets do |t|
      # Associations
      t.belongs_to :users
      t.belongs_to :events

      # Table Fields
      t.integer :event_id
      t.integer :user_id
      t.integer :ticket_nums

      t.timestamps
    end
  end
end
