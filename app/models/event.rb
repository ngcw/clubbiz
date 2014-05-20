class Event < ActiveRecord::Base
  belongs_to :clubs
  has_many :users
  validates :name , presence:true
  validates :memberOnly , presence:true
  validates :date , presence:true
  validates :place , presence:true
  def self.save(upload)
    name = upload['datafile'].original_filename
    directory = "assets/club/data"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end
end
