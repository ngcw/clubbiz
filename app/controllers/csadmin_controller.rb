class CsadminController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user

    def index
        @approved_clubs = Club.where(approved: false)
    end

    def announce
        
    end

end
