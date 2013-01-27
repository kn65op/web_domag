class StoragesController < ApplicationController

  before_filter :canView?, :only => :view
  before_filter :canManage?, :only => [:edit, :delete, :confirmed_delete]

  def index
    @my_storages = current_user.storages.find_all{|s| s.getNested == 0 && s.isUserAdmin?(current_user) == true}.sort {|a,b| a.name <=> b.name}
    @shared_storages = current_user.storages.find_all{|s| s.isUserAdmin?(current_user) == false}.sort {|a,b| a.name <=> b.name}
  end

  def new
    @users = getAllUsersWithoutCurrentUser
    if params[:storage] != nil #Save to database
      @storage = Storage.new(params[:storage]) #create new storage
      @storage.userAdmin!(current_user, true) #set admin
      if @storage.save #no errors on save, redirect
        redirect_to storages_path, :notice => t('storages.new.successful')
      else
        @error = t('storages.new.unsuccessful')
      end
    else
      @storage = Storage.new
    end
  end

  def view
    @storage = getStorage
    @ti = @storage.thing_instances.find_all{|t| t.amount > 0}
  end

  def edit
    @users = getAllUsersWithoutCurrentUser
    #TODO: remove current user from @users
    @storage = getStorage
    if params[:storage] != nil && @storage.update_attributes(params[:storage])
      @storage.userAdmin!(current_user, true) #set admin
      redirect_to view_storage_path(@storage), :notice => t('storages.edit.successful')
    end
  end

  def delete
    @storage = getStorage
  end

  def confirmed_delete
    storage = getStorage
    storage.delete

    redirect_to storages_path, :notice => t('storages.delete.succesful')
  end

private
  def getAllUsersWithoutCurrentUser
    @users = User.all
    @users.delete(current_user)
    @users
  end

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
