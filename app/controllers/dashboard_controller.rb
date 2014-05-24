class DashboardController < ApplicationController

  def index
    # this action is the default fallthrough for anyone accessing Dashboard.
    # debugger
    @clubs = current_user.clubs
    @events = current_user.events
    # @announcements # App-Wide Announcement
  end

  def csadmin
    # this action is only accessible to users with Super Admin privileges.
    # @pending_clubs = adminstration.pending_clubs
  end

end
