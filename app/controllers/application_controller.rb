class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

	private
  
	def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      session[:admin] = (username == Rails.configuration.admin_user && password == Rails.configuration.admin_password)
    end    
  end

  def set_locale
	  if params[:locale] == "" || params[:locale].nil?
	  	I18n.locale = I18n.default_locale
    else 
    	I18n.locale = params[:locale]
    end
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end


end
