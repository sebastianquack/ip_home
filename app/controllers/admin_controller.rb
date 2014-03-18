class AdminController < ApplicationController

  before_filter :authenticate

  def index
  end

  def logout
    session[:admin] = false
    redirect_to root_url
  end

end
