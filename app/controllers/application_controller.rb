class ApplicationController < ActionController::Base
  protect_from_forgery

	#setting locale
  before_filter :set_locale_from_url
	
	#authentication
#	before_filter :authenticate_user!
end
