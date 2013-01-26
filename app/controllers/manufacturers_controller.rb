class ManufacturersController < ApplicationController

  before_filter :canView?, :only => [:edit, :delete, :confirmed_delete, :view]

  def index
    @manufactures = current_user.manufacturers
  end

  def new
    if params[:manufacturer] != nil #Save to database
      @manufacturer = Manufacturer.new(params[:manufacturer]) #create new manufacturer
      @manufacturer.user = current_user
      if @manufacturer.save #no errors on save, redirect
        redirect_to manufacturers_path, :notice => t('manufacturers.new.successful')
      end
    else
      @manufacturer = Manufacturer.new
    end
  end

  def edit
    @manufacturer = getManufacturer
    if params[:manufacturer] != nil && @manufacturer.update_attributes(params[:manufacturer])
      redirect_to view_manufacturer_path(@manufacturer), :notice => t('manufacturers.edit.successful')
    end
  end

  def view
    @manufacturer = getManufacturer
  end

  def delete
    @manufacturer = getManufacturer
  end

  def confirmed_delete
    manufacturer = getManufacturer
    manufacturer.delete

    redirect_to manufacturers_path, :notice => t('manufacturers.delete.succesful')
  end

private
  def getManufacturer
    Manufacturer.find(params[:id])
  end

  def canView?
    redirect_to manufacturers_path, :flash => {:error => t('flash.no_view_permission')} if !getManufacturer.canView?(current_user)
  end

end
