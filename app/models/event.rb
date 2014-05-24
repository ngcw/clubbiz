require "mathn"
class Event < ActiveRecord::Base

  belongs_to :clubs
  has_many :users, through: :reserve_tickets
  has_many :reserve_tickets
  has_many :clubs , through: :shared_events
  has_many :shared_events
  has_many :discussions
  has_attached_file :banner, :styles => { :large => "600x300>" , :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/
  has_attached_file :image1, :styles => { :medium => "300x300>" , :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image1, :content_type => /\Aimage\/.*\Z/
  has_attached_file :image2, :styles => { :medium => "300x300>" , :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image2, :content_type => /\Aimage\/.*\Z/
  has_attached_file :image3, :styles => { :medium => "300x300>" , :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  
  validates_attachment_content_type :image3, :content_type => /\Aimage\/.*\Z/
  validates :name , presence:true
  validates :date , presence:true
  validates :place , presence:true
  def attendees
    self.total_tickets - self.remaining_tickets 
  end
end
