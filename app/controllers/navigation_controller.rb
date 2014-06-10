class NavigationController < ApplicationController

	def index 
    @page = Page.where(:welcome_page => true).order('id ASC').first
    if @page
      redirect_to :controller => "pages", :action => "show", :id => @page.slug
    else
      redirect_to :controller => "pages", :action => "show", :id => 'welcome'
    end
	end

  def show
  	set_locale
		respond_to do |format|
			format.html { render :partial => "navigation/user_menu" }
  	end
  end

end
