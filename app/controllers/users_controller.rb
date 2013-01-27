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
    act_param = "things1"
    if params[act_param] != nil
      saveShopping(params)
      redirect_to root_path, :notice => (t 'users.shopping.done')
    end
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

private
  def saveShopping(params)
    param_text = "things"
    i = 1
    act_param = param_text + i.to_s
    while params[act_param] != nil
      saveThingInstance(params[act_param])
      i = i + 1
      act_param = param_text + i.to_s
    end
  end

  def saveThingInstance(thing)
    ti = ThingInstance.new
    ti.storage = Storage.find(thing[:storage])
    ti.thing = Thing.find(thing[:thing])
    ti.size = thing[:size].to_f
    if thing[:price] != nil
      ti.price = thing[:price].to_f
      ti.currency = thing[:currency]
    end
    day = thing[:valid_until]["(3i)"]
    month = thing[:valid_until]["(2i)"]
    year = thing[:valid_until]["(1i)"]
    date = Date.civil(year.to_i, month.to_i, day.to_i)
    ti.valid_until = date
    ti.shop = Shop.find(thing[:shop]) if thing[:shop] != ""
    ti.manufacturer = Manufacturer.find(thing[:manufacturer]) if thing[:manufacturer] != ""
    ti.purchase_date = Date.today
    puts ti
    puts ti.save
  end
end
