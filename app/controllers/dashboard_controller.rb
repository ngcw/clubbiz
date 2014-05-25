class DashboardController < ApplicationController

  def index
    # this action is the default fallthrough for anyone accessing Dashboard.
    # debugger
    @clubs = current_user.clubs
    @reserved_events = ReserveTicket.where(user_id: current_user.id)
    @events ||= [] 
    @reserved_events.each do |event|
      item = Event.where(id: event.event_id).take
      @events << item
    end
    # @announcements # App-Wide Announcement
  end

  def csadmin
    @approved_clubs = Club.where(approved: false)

  end

end
