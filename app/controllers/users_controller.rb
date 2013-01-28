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
      saved = saveShopping(params)
      if saved != []
        redirect_to root_path, :notice => ((t 'user.shopping.not_done1') + saved.size.to_s + (t 'user.shopping.not_done2'))
      else
        redirect_to root_path, :notice => (t 'user.shopping.done')
      end
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

  def move_thing_instance
    @thing_instance = getThingInstance
    if (params[:storage] == nil)
      @storages = current_user.storages.sort{|a,b| a.getFullName <=> b.getFullName}
      render "move_thing_instance", :layout => false
    else
      @thing_instance.storage = Storage.find(params[:storage])
      @thing_instance.save
      render :nothing => true
    end
  end

  def consume_thing_instance
    @thing_instance = getThingInstance
    if (params[:amount] == nil)
      render "consume_thing_instance", :layout => false
    else
      amount = params[:amount].to_f
      puts amount
      puts params[:amount]
      if amount > @thing_instance.amount
        @status = t ('user.consume.to_much')
      elsif amount <= 0
        @status = t ('user.consume.below_zero')
      else
        consume = Consume.new
        consume.thing_instance = @thing_instance
        consume.amount = amount
        consume.user = current_user
        consume.date = Date.today
        consume.save if amount != 0
        @status = "OK"
      end
      render "consume_reponse", :layout => false
    end
  end

private
  def getThingInstance
    ThingInstance.find(params[:id])
  end

  def saveShopping(params)
    invalid = []
    param_text = "things"
    i = 1
    act_param = param_text + i.to_s
    while params[act_param] != nil
      invalid = invalid + saveThingInstance(params[act_param])
      i = i + 1
      act_param = param_text + i.to_s
    end
    return invalid
  end

  def saveThingInstance(thing)
    ti = ThingInstance.new
    ti.storage = Storage.find(thing[:storage])
    ti.thing = Thing.find(thing[:thing]) if thing[:thing] != nil
    puts thing[:size]
    puts thing[:size].gsub(",",".")
    puts thing[:size].gsub(",",".").to_f
    ti.size = thing[:size].gsub(",",".").to_f
    if thing[:price] != ""
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
    if !ti.save
      return ti.to_a
    end
    return []
  end
end
