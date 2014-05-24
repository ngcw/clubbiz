class ClubsController < ApplicationController
  before_action :set_club, only: [:approveEvent, :show, :edit, :update, :destroy, :join, :leave, :approve, :follow]
  before_action :authenticate_user! #, only: [:edit,:new,:update,:destroy]

  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.all
  end
  
  # GET /club/incdex
  def allclubs
    @clubs = Club.all
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
    # pending shared events
    @shared_events = SharedEvent.where(clubId: @club.id, approved: false)
    @pendingrequest ||= []
    @shared_events.each do |event|
      event_item = Event.where(id: event.eventId).take
      @pendingrequest << event_item
    end
    # approved shared events
    @approved_events = SharedEvent.where(clubId: @club.id, approved: true)
    @approved_list ||= []
    @approved_events.each do |event|
      event_item = Event.where(id: event.eventId).take
      @approved_list << event_item
    end
    # hosted events
    @hosted_events = Event.where(club_id: @club.id)
  end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(club_params)
    @club.approved = false
    @club.owner_id = current_user.id
    @club.users << current_user  #owner should be member in the club
    
    ((params[:club][:administrators]).scan(/.+/)).each.with_index do |match, index|
       
       adminUser = User.find_by(email: match.to_s)
 
       if (adminUser)
         #check if user alreay exist as admin
         admin = Administrator.find_by(adminId: adminUser.id)
         if (!admin)
           admin = Administrator.new
           admin.adminId = adminUser.id
           admin.save
         end
         @club.administrators << admin
         if !(@club.users.include? adminUser)
          @club.users << adminUser  #admins should be members in the club
         end
       else
         respond_to do |format|
          format.html { render :new }
          format.json { render json: @club.errors, status: :unprocessable_entity }
        end
        return
       end
    end
    
    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, notice: 'Club was successfully created. you will be notifed once approved' }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # Join club
  def join
    respond_to do |format|
      if @club.users.include? current_user
        format.html { redirect_to @club, notice: 'Already member!' }
        format.json { render :show, status: :created, location: @club }
      else
        @club.users << current_user
        @club.save
        format.html { redirect_to @club, notice: 'Congratulation! You Joined the Club.' }
        format.json { render :show, status: :created, location: @club }
      end      
    end
  end
  
  def leave
    respond_to do |format|
      if @club.users.include? current_user
        @club.users.delete(current_user)
        @club.save
        format.html { redirect_to @club, notice: 'You Left Club' }
        format.json { render :show, status: :created, location: @club }
      else   
        format.html { redirect_to @club, notice: 'Already not Member!' }
        format.json { render :show, status: :created, location: @club }
      end
    end
  end
  
  def follow
   #check if user alreay exist as admin
   follower = Follower.find_by(followId: current_user.id)
   if (!follower)
     follower = Follower.new
     follower.followId = current_user.id
     follower.save
   end

    respond_to do |format|
      if @club.followers.include? follower
        format.html { redirect_to @club, notice: 'Already following!' }
        format.json { render :show, status: :created, location: @club }
      else
        @club.followers << follower
        @club.save
        format.html { redirect_to @club, notice: 'You are now following the club.' }
        format.json { render :show, status: :created, location: @club }
      end     
    end
  end
  def approve
    respond_to do |format|
      if @club.approved
        format.html { redirect_to @club, notice: 'Already Approved!' }
        format.json { render :show, status: :created, location: @club }
      else
        @club.approved = true
        @club.save
        format.html { redirect_to @club, notice: 'Club was successfully approved' }
        format.json { render :show, status: :created, location: @club }
      end     
    end
  end
  def approveEvent
    respond_to do |format|
      @shareEvent = SharedEvent.find(params[:Eid])
      if @shareEvent.approved
        format.html { redirect_to @club, notice: 'Event sharing already Approved!' }
        format.json { render :show, status: :created, location: @club }
      else
        @shareEvent.update(approved: true)
        format.html { redirect_to @club, notice: 'Event sharing was successfully approved' }
        format.json { render :show, status: :created, location: @club }
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:name, :description)
    end
end
