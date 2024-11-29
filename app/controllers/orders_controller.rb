class OrdersController < ApplicationController
  before_action :set_item, only: [:index]
  def index
    @order_address = OrderAddress.new
  end

  def create
    
  end


  def set_item
    @item = Item.find(params[:item_id])
  end
end
