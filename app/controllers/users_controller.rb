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

  def shopping

  end

  def add_thing
    @storages = current_user.storages.sort{|a,b| a.getFullName <=> b.getFullName}
    @categories = current_user.categories.sort{|a,b| a.getFullName <=> b.getFullName}
    @shops = current_user.shops.sort{|a,b| a.name <=> b.name}
    @manufacturers = current_user.manufacturers.sort{|a,b| a.name <=> b.name}
    @nr = params[:nr]
    render "add_thing", :layout => false
  end

  def get_things
    @things = Category.find(params[:id]).things
    render "get_things", :layout => false
  end

  def get_unit
    @unit = Thing.find(params[:id]).unit
    render "get_unit", :layout => false
  end

end
