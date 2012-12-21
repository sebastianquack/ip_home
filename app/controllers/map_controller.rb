class MapController < ApplicationController

	def get_position
		render json: MapPosition.last
	end

  def update  
		@map_position = MapPosition.new(:lat => params[:lat], :lng => params[:lng], :ip => request.remote_ip)
		if @map_position.save 
			render json: @map_position
  	end
  end

end
