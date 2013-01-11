# To change this template, choose Tools | Templates
# and open the template in the editor.

class UsersController < ApplicationController
	skip_before_filter :authenticate_user!, :only => [:main_page]
	def main_page
		puts current_user
#		render :partial => "users/login", :layout => "application"
	end

	def second
		puts current_user
	end
end
