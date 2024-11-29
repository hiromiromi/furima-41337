class OrdersController < ApplicationController
  before_action :set_item, only: [:index]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @order_address.save
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :region_id, :city, :house_number, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
