class StoragesController < ApplicationController

  def index
    @storages = current_user.storages
  end

  def new
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
    @storage = Storage.find(params[:id])
    redirect_to storages_path, :notice => t('flash.no_view_permission') if !@storage.users.include? current_user

  end

  def edit
  end

  def delete
  end
end
