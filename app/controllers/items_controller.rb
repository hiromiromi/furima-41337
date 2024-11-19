class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, satatus: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:items).permit(:image, :item, :item_description, :category_id, :item_condition_id, :shipping_cost_id, :region_id, :number_of_day_id, :price).merge(user_id: current_user.id)
  end
end
