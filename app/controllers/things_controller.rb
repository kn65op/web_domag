class ThingsController < ApplicationController

  before_filter :canView?, :only => [:edit, :delete, :confirmed_delete, :view, :get_limits]

  def index
    @things = current_user.getThings
  end

  def new
    #TODO: Check if there are at least one category
    @categories = getCategories
    @things = getCategories
    if params[:thing] != nil #Save to database
      @thing = Thing.new(params[:thing]) #create new thing
      if @thing.save #no errors on save, redirect
        redirect_to things_path, :notice => t('things.new.successful')
      end
    else
      @thing = Thing.new
    end
  end

  def view
    @thing = getThing
    if params[:limit]  != nil
      @thing.limit.update_attributes(params[:limit])
    end
  end

  def edit
    @categories = getCategories
    @thing = getThing
    if params[:thing] != nil && @thing.update_attributes(params[:thing])
      redirect_to view_thing_path(@thing), :notice => t('things.edit.successful')
    end
  end

  def delete
    @thing = getThing
  end

  def confirmed_delete
    thing = getThing
    thing.delete

    redirect_to things_path, :notice => t('things.delete.succesful')
  end

  def get_limits
    @thing = getThing
    if params[:do] == "create"
      @thing.limit = Limit.new
      render :layout => false
    elsif params[:do] == "delete"
      if @thing.limit != nil
        @thing.limit.delete
      end
      render :nothing => true
    else
      redirect_to view_thing_path(@thing), :notice => t('things.get_limits.wrong_param')
    end
  end

private
  def getThing
    Thing.find(params[:id])
  end

  def getCategories
    current_user.categories
  end

  def canView?
    redirect_to things_path, :flash => {:error => t('flash.no_view_permission')} if !getThing.canView?(current_user)
  end
end
