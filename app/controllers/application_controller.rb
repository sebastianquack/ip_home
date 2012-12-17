class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  I18n.default_locale = :de

	private
  
	def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.configuration.admin_user && password == Rails.configuration.admin_password
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end


end
