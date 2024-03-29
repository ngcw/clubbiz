class EventsController < ApplicationController
  before_action :set_event, only: [:share,:show, :edit, :update, :destroy, :reserve]
  before_action :authenticate_user!, only: [:edit,:new,:update,:reserve,:destroy]
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @clubs = Club.where.not(id: @event.club_id)
    @curr_club = Club.where(id: @event.club_id).take
    @unshared_club ||= []
    @shared_club ||= []
    @clubs.each do |club|
      if !SharedEvent.exists?(:eventId => @event.id, :clubId => club.id)
        @unshared_club << club
      elsif SharedEvent.exists?(:eventId => @event.id , :clubId => club.id, :approved => true)
        @shared_club << club
      end
    end
    
  end

  # GET /events/new
  def new
    @event = Event.new
    @club = Club.find(params[:format])
  end

  # GET /events/1/edit
  def edit
    @club = Club.find(@event.club_id)
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.remaining_tickets = params[:event][:total_tickets]
    @club = Club.where(id: params[:event][:club_id]).take
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to club_path(@event.club_id), notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  # Reserve ticket
  def reserve
    @reserve = ReserveTicket.new
    @reserve.event_id = @event.id
    @reserve.user_id = current_user.id
    @reserve.ticket_nums = params[:ticket_nums]
    respond_to do |format|
      if @event.remaining_tickets - @reserve.ticket_nums < 0
        format.html { redirect_to @event, notice: 'There are not enough available tickets!' }
        format.json { render :show, status: :created, location: @event } 
      elsif ReserveTicket.exists?(:user_id => current_user.id,:event_id => @event.id)
        format.html { redirect_to @event, notice: 'Already reserved ticket!' }
        format.json { render :show, status: :created, location: @event } 
      else
        @reserve.save
        tickets_left = @event.remaining_tickets - @reserve.ticket_nums
        @event.update(remaining_tickets: tickets_left)
        format.html { redirect_to @event, notice: 'Congratulation! You Joined the Event.' }
        format.json { render :show, status: :created, location: @event }
      end
    end
  end
  
  def share
    params[:club_list].each do |clubid|
      shared = SharedEvent.new
      shared.approved = false
      shared.eventId = @event.id
      shared.clubId = clubid
      shared.save
    end
    respond_to do |format|
      format.html { redirect_to @event, notice: 'Event successfully shared.' }
      format.json { render :show, status: :created, location: @event }
    end    
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :memberOnly, :date, :place, :price, :website, :banner, :image1, :image2, :image3, :salesLocation, :description, :termsConditions, :total_tickets, :club_id,:ticket_nums)
    end

end
