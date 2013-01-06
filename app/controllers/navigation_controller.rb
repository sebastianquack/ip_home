class NavigationController < ApplicationController

	def index 
		redirect_to :controller => "pages", :action => "show", :id => "welcome"
	end

  def show
  	set_locale
		respond_to do |format|
			format.html { render :partial => "navigation/user_menu" }
  	end
  end

end
