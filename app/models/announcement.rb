class Announcement < ActiveRecord::Base
    # Announcements can only be published to clubs (members/owners/admins)

    belongs_to :user
    belongs_to :club
    
end
