class Club < ActiveRecord::Base

  belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'
  has_many :administrators
  has_and_belongs_to_many :users

  has_many :events
  has_and_belongs_to_many :shared_events
end
