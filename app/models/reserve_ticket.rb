class ReserveTicket < ActiveRecord::Base
  belongs_to :events
  belongs_to :users
end
