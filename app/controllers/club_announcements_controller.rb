class ClubAnnouncementsController < ApplicationController
  before_action :set_club_announcement, only: [:show, :edit, :update, :destroy]

  # GET /club_announcements
  # GET /club_announcements.json
  def index
    @club_announcements = ClubAnnouncement.all
  end

  # GET /club_announcements/1
  # GET /club_announcements/1.json
  def show
  end

  # GET /club_announcements/new
  def new
    @club_announcement = ClubAnnouncement.new
  end

  # GET /club_announcements/1/edit
  def edit
  end

  # POST /club_announcements
  # POST /club_announcements.json
  def create
    @club_announcement = ClubAnnouncement.new(club_announcement_params)
    @club_announcement.user_id = current_user.id
    @club_announcement.club_id = params[:club_id]

    respond_to do |format|
      if @club_announcement.save
        format.html { redirect_to @club_announcement, notice: 'Club announcement was successfully created.' }
        format.json { render :show, status: :created, location: @club_announcement }
      else
        format.html { render :new }
        format.json { render json: @club_announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /club_announcements/1
  # PATCH/PUT /club_announcements/1.json
  def update
    respond_to do |format|
      if @club_announcement.update(club_announcement_params)
        format.html { redirect_to @club_announcement, notice: 'Club announcement was successfully updated.' }
        format.json { render :show, status: :ok, location: @club_announcement }
      else
        format.html { render :edit }
        format.json { render json: @club_announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /club_announcements/1
  # DELETE /club_announcements/1.json
  def destroy
    @club_announcement.destroy
    respond_to do |format|
      format.html { redirect_to club_announcements_url, notice: 'Club announcement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_announcement
      @club_announcement = ClubAnnouncement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_announcement_params
      params.require(:club_announcement).permit(:content, :title)
    end
end
