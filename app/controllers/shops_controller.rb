class ShopsController < ApplicationController

  before_filter :canView?, :only => [:edit, :delete, :confirmed_delete, :view]

  def index
    @shops = current_user.shops
  end

  def new
    if params[:shop] != nil #Save to database
      @shop = Shop.new(params[:shop]) #create new shop
      @shop.user = current_user
      if @shop.save #no errors on save, redirect
        redirect_to shops_path, :notice => t('shops.new.successful')
      end
    else
      @shop = Shop.new
    end
  end

  def edit
    @shop = getShop
    if params[:shop] != nil && @shop.update_attributes(params[:shop])
      redirect_to view_shop_path(@shop), :notice => t('shops.edit.successful')
    end
  end

  def view
    @shop = getShop
    @ti = @shop.getNonZeroThingInstances
  end

  def delete
    @shop = getShop
  end

  def confirmed_delete
    shop = getShop
    shop.delete

    redirect_to shops_path, :notice => t('shops.delete.succesful')
  end

private
  def getShop
    Shop.find(params[:id])
  end

  def canView?
    redirect_to shops_path, :flash => {:error => t('flash.no_view_permission')} if !getShop.canView?(current_user)
  end
end
