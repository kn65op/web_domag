# To change this template, choose Tools | Templates
# and open the template in the editor.

class UsersController < ApplicationController
	def main_page
		puts current_user
#		render :partial => "users/login", :layout => "application"
	end
end
