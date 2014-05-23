class CreateReserveTickets < ActiveRecord::Migration
  def change
    create_table :reserve_tickets do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :ticket_nums

      t.timestamps
    end
  end
end
