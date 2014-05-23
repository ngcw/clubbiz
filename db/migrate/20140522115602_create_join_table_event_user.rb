class CreateJoinTableEventUser < ActiveRecord::Migration
  def change
    create_join_table :events, :users do |t|
      t.belongs_to :event
      t.belongs_to :user
      t.integer :ticket_num
      # t.index [:event_id, :user_id]
      # t.index [:user_id, :event_id]
    end
  end
end
