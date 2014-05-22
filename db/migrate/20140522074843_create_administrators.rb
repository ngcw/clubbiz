class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.integer :adminId

      t.timestamps
    end
  end
end
