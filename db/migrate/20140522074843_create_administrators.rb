class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.integer :adminId

      t.timestamps
    end
    add_index :administrators, :adminId,   unique: true
  end
end
