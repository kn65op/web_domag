class ManufacturersController < ApplicationController

  before_filter :canView?, :only => [:edit, :delete, :confirmed_delete, :view]

  def index
  end

  def new
  end

  def edit
  end

  def view

  end

  def delete
  end

  def confirmed_delete
  end

private
  def getManufacturer
    Manufacturer.find(params[:id])
  end

  def canView?
    redirect_to manufacturers_path, :flash => {:error => t('flash.no_view_permission')} if !getManufacturer.canView?(current_user)
  end

end
