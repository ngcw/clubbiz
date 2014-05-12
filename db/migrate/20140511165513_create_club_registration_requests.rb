class CreateClubRegistrationRequests < ActiveRecord::Migration
  def change
    create_table :club_registration_requests do |t|
      t.integer :id
      t.integer :clubId
      t.datetime :registrationDate

      t.timestamps
    end
  end
end
