class Event < ActiveRecord::Base

  has_and_belongs_to_many :sharedWithClubs, :class_name => 'Club', :foreien_key => 'shared_event_id'
end
