class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.string :followId
      t.string :integer

      t.timestamps
    end
    add_index :followers, :followId,   unique: true
  end
end
