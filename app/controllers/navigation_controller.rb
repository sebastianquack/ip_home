class NavigationController < ApplicationController

  def show
  	set_locale
		respond_to do |format|
			format.html { render :partial => "layouts/navigation" }
  	end
  end

end
