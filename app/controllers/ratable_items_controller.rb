class RatableItemsController < ApplicationController
  def index
    @ratable_items = RatableItem.all
  end

  def show
    @ratable_item = RatableItem.find(params[:id])
    unless current_user.admin?
        redirect_to root_path, :alert => "Access denied."
    end
  end

  def new
    @ratable_item = RatableItem.new
  end

  def create
    @ratable_item = RatableItem.new(ratable_item_params)

    @ratable_item.save
    redirect_to @ratable_item
  end

  private

  def ratable_item_params
    params.require(:ratable_item).permit(:name, :ratable_item_category_id)
  end
end
