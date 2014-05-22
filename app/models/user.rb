class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :owned, :class_name => "Club", :foreign_key => "owner_id"
  has_and_belongs_to_many :administrated, :class_name => 'Club', :foreign_key => 'administrator_id'
  has_and_belongs_to_many :clubs
  has_and_belongs_to_many :events
  has_many :club_announcements

end
