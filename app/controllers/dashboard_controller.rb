class DashboardController < ApplicationController

  def index
    # this action is the default fallthrough for anyone accessing Dashboard.
    # debugger
    @clubs = current_user.clubs
    @events = current_user.events
    # @announcements # App-Wide Announcement
  end

  def csadmin
    @approved_clubs = Club.where(approved: false)

  end

end
