class CategoriesController < ApplicationController
  before_filter :canView?, :only => [:edit, :delete, :confirmed_delete, :view]

  def index
    @categories = current_user.categories
  end

  def new
    if params[:category] != nil #Save to database
      @category = Category.new(params[:category]) #create new category
      @category.user = current_user
      if @category.save #no errors on save, redirect
        redirect_to categories_path, :notice => t('categories.new.successful')
      end
    else
      @category = Category.new
    end
  end

  def view
    @category = getCategory
  end

  def edit
    @category = getCategory
    if params[:category] != nil && @category.update_attributes(params[:category])
      redirect_to view_category_path(@category), :notice => t('categories.edit.successful')
    end
  end

  def delete
    @category = getCategory
  end

  def confirmed_delete
    category = getCategory
    category.delete

    redirect_to categories_path, :notice => t('categories.delete.succesful')
  end

private
  def getCategory
    Category.find(params[:id])
  end

  def canView?
    redirect_to categories_path, :flash => {:error => t('flash.no_view_permission')} if !getCategory.canView?(current_user)
  end

end
