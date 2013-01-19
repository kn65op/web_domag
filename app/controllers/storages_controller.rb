class StoragesController < ApplicationController

  before_filter :canView?, :only => :view
  before_filter :canManage?, :only => [:edit, :delete, :confirmed_delete]

  def index
    @storages = current_user.storages
  end

  def new
    @users = User.all
    if params[:storage] != nil #Save to database
      @storage = Storage.new(params[:storage]) #create new storage
      @storage.users << current_user  #connect with user
      if @storage.save #no errors on save, redirect
        @storage.userAdmin!(current_user, true) #set admin
        redirect_to storages_path, :notice => t('storages.new.successful')
      end
    else
      @storage = Storage.new
    end
  end

  def view
    @storage = getStorage
  end

  def edit
    @users = User.all.delete(current_user)
    @storage = getStorage
    if params[:storage] != nil && @storage.update_attributes(params[:storage])
      redirect_to view_storage_path(@storage), :notice => t('storages.edit.successful')
    end
  end

  def delete
    @storage = getStorage
  end

  def confirmed_delete
    @storage = getStorage
    @storage.delete
    redirect_to storages_path, :notice => t('storages.delete.succesful')
  end

private
  def getStorage
    Storage.find(params[:id])
  end

  def canView?
    redirect_to storages_path, :flash => {:error => t('flash.no_view_permission')} if !getStorage.canView?(current_user)
  end

  def canManage?
    redirect_to storages_path, :flash => {:error => t('flash.no_view_permission')} if !getStorage.isUserAdmin?(current_user)
  end
end
