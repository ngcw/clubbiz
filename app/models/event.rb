class Event < ActiveRecord::Base
  belongs_to :clubs
  has_many :users
  validates :name , presence:true
  validates :memberOnly , presence:true
  validates :date , presence:true
  validates :place , presence:true
end
