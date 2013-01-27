# To change this template, choose Tools | Templates
# and open the template in the editor.

class UsersController < ApplicationController
	skip_before_filter :authenticate_user!, :only => [:main_page]
	def main_page
    if current_user != nil
      @invalid = current_user.getInvalid7Days
      @critical = current_user.getLimitsCritical
      @ends = current_user.getLimitsEnds
      @full = current_user.getLimitsFull
    end
	end

	def settings
		
  end

end
