class Event < ActiveRecord::Base

  belongs_to :clubs
  has_and_belongs_to_many :users
  has_attached_file :banner, :styles => { :large => "600x300>" , :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/
  has_attached_file :image1, :styles => { :medium => "300x300>" , :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image1, :content_type => /\Aimage\/.*\Z/
  has_attached_file :image2, :styles => { :medium => "300x300>" , :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image2, :content_type => /\Aimage\/.*\Z/
  has_attached_file :image3, :styles => { :medium => "300x300>" , :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image3, :content_type => /\Aimage\/.*\Z/
  validates :name , presence:true
  validates :memberOnly , presence:true
  validates :date , presence:true
  validates :place , presence:true
end
