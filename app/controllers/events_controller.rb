class EventsController < ApplicationController
  # before_action :require_authentication
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :authorize_event!
  after_action :verify_authorized


  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @group = Group.find(params[:group_id])
    @event = @group.events.new
  end

  # GET /events/1/edit
  def edit
    
  end

  # event /events or /events.json
  def create
    @group_id = params[:event][:group_id]
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        @group_id = params[:group_id]
        format.html { redirect_to @event, notice: "Event was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to group_url(id: @event.group_id), notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = event.find(params[:id])
    end
    def authorize_event!
      
      authorize(@event || event)
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :content, :group_id)
    end

end