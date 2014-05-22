class AddClubToAdministratros < ActiveRecord::Migration
  def change
    add_reference :administrators, :club, index: true
  end
end
