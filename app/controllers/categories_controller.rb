class CategoriesController < ApplicationController
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
  def getCategory
    Category.find(params[:id])
  end

  def canView?
    redirect_to categories_path, :flash => {:error => t('flash.no_view_permission')} if !getCategory.canView?(current_user)
  end

end
