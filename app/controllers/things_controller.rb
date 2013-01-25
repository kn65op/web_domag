class ThingsController < ApplicationController

  before_filter :canView?, :only => [:edit, :delete, :confirmed_delete, :view]

  def index
  end

  def new
  end

  def view
  end

  def edit
  end

  def delete
  end

  def confirmed_delete
  end

private
  def getThing
    Thing.find(params[:id])
  end

  def canView?
    redirect_to things_path, :flash => {:error => t('flash.no_view_permission')} if !getThing.canView?(current_user)
  end
end
