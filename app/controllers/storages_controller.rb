class StoragesController < ApplicationController

  def index
    @storages = current_user.storages
  end

  def add
  end

  def edit
  end

  def delete
  end
end
