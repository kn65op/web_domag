class ThingsController < ApplicationController

  before_filter :canView?, :only => [:edit, :delete, :confirmed_delete, :view]

  def index
    @things = current_user.getThings
  end

  def new
    @things = getCategories
    if params[:thing] != nil #Save to database
      @thing = Thing.new(params[:thing]) #create new thing
      @thing.user = current_user
      if @thing.save #no errors on save, redirect
        redirect_to things_path, :notice => t('things.new.successful')
      end
    else
      @thing = Thing.new
    end
  end

  def view
    @thing = getThing
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

private
  def getThing
    Thing.find(params[:id])
  end

  def getCategories
    current_user.things
  end

  def canView?
    redirect_to things_path, :flash => {:error => t('flash.no_view_permission')} if !getThing.canView?(current_user)
  end
end
