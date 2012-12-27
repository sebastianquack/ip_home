class NavigationController < ApplicationController

	def index 
		redirect_to :controller => "pages", :action => "show", :id => "welcome"
	end

  def show
  	set_locale
		respond_to do |format|
			format.html { render :partial => "layouts/navigation" }
  	end
  end

end
