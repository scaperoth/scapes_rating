class RatableItemCategoriesController < ApplicationController
  def index
    @ratable_item_categories = RatableItemCategory.all
  end

  def show
    @ratable_item_category = RatableItemCategory.find(params[:id])
    unless current_user.admin?
        redirect_to root_path, :alert => "Access denied."
    end
  end

  def new
    @ratable_item_category = RatableItemCategory.new
  end

  def create
    @ratable_item_category = RatableItemCategory.new(ratable_item_category_params)

    @ratable_item_category.save
    redirect_to @ratable_item_category
  end

  private
  
  def ratable_item_category_params
    params.require(:ratable_item_category).permit(:name)
  end

end
