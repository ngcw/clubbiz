class CsadminController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user

    def index
        @approved_clubs = Club.where(approved: false)
        @clubs = Club.where(approved: true)
        @announcements = Announcement.all
        #debugger
    end

    # POST 
    # POST /dashboard/csadmin/announce
    def announce
        puts params
        @announcement = Announcement.new

        if params[:club_exec].match("1")
            @announcement.admintoggle = true
        else
            @announcement.admintoggle = false
        end

        if params[:club_all].match("1")
            @announcement.membertoggle = true
        else
            @announcement.membertoggle = false
        end

        @announcement.message = params[:announcement]
        @announcement.club = params["club_id[]"]
        @announcement.save
    end

end
