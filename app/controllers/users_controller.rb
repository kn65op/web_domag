# To change this template, choose Tools | Templates
# and open the template in the editor.

class UsersController < ApplicationController
	skip_before_filter :authenticate_user!, :only => [:main_page]
	def main_page
#		render :partial => "users/login", :layout => "application"
	end

	def settings
		
	end

end
