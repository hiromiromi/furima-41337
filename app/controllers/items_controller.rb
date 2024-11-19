class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:items).permit(:image, :item, :item_description, :category_id, :item_condition_id, :shipping_cost_id, :region_id, :number_of_day_id, :price)
  end
end
