class ShopsController < ApplicationController

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
  def getShop
    Shop.find(params[:id])
  end

  def canView?
    redirect_to shops_path, :flash => {:error => t('flash.no_view_permission')} if !getShop.canView?(current_user)
  end
end
