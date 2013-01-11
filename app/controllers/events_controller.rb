class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all :order=>'date ASC'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

	def list
		@events = Event.all :order=>'date DESC'
		@events_by_year = @events.group_by { |e| e.date.year }
    respond_to do |format|
      format.html { render :layout => ! request.xhr? }
    end
	end	

	def upcoming
		@events = Event.all :order=>'date ASC', :limit=>3
    respond_to do |format|
      format.html { render :layout => ! request.xhr? }
    end
	end	

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html { render :layout => ! request.xhr? }
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @use_end_date = false
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

		unless params[:use_end_date] == "1"
			params[:event].delete_if{ |key, value| key.match(/^end_date/) }
			params[:event][:end_date] = nil;
		end

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
