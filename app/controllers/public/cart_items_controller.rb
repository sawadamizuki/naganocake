class Public::CartItemsController < ApplicationController

  def index
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    binding.pry
    @cart_item = Cart_item.new(cart_item_params)
    @cart_item.save
    redirect_to order_path(@order)
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end
