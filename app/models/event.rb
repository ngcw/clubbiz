class Event < ActiveRecord::Base

  belongs_to :clubs
  has_many :users
  has_and_belongs_to_many :sharedWithClubs, :class_name => 'Club', :foreign_key => 'shared_event_id'
  validates :name , presence:true
  validates :memberOnly , presence:true
  validates :date , presence:true
  validates :place , presence:true
end
