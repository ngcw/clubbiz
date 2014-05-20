class Club < ActiveRecord::Base

  belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'
  has_and_belongs_to_many :administrators, :class_name => 'User', :foreign_key => 'administrator_id'
  has_and_belongs_to_many :users

  has_many :events
  has_and_belongs_to_many :sharedEvents, :class_name => 'Event', :foreien_key => 'shared_event_id'
end
