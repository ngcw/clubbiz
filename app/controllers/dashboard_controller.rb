class DashboardController < ApplicationController

  def index
    @clubs = current_user.clubs
  end

  def update

  end
end
