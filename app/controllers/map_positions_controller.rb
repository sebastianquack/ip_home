class MapPositionsController < ApplicationController
  # GET /map_positions
  # GET /map_positions.json
  def index
    @map_positions = MapPosition.find(:all, :order => "id desc", :limit => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @map_positions }
    end
  end

  # GET /map_positions/1
  # GET /map_positions/1.json
  def show
    @map_position = MapPosition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @map_position }
    end
  end

  # GET /map_positions/new
  # GET /map_positions/new.json
  def new
    @map_position = MapPosition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @map_position }
    end
  end

  # GET /map_positions/1/edit
  def edit
    @map_position = MapPosition.find(params[:id])
  end

  # POST /map_positions
  # POST /map_positions.json
  def create
    @map_position = MapPosition.new(params[:map_position])

    respond_to do |format|
      if @map_position.save
        format.html { redirect_to @map_position, notice: 'Map position was successfully created.' }
        format.json { render json: @map_position, status: :created, location: @map_position }
      else
        format.html { render action: "new" }
        format.json { render json: @map_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /map_positions/1
  # PUT /map_positions/1.json
  def update
    @map_position = MapPosition.find(params[:id])

    respond_to do |format|
      if @map_position.update_attributes(params[:map_position])
        format.html { redirect_to @map_position, notice: 'Map position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @map_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /map_positions/1
  # DELETE /map_positions/1.json
  def destroy
    @map_position = MapPosition.find(params[:id])
    @map_position.destroy

    respond_to do |format|
      format.html { redirect_to map_positions_url }
      format.json { head :no_content }
    end
  end
end
