class Public::ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def customers_params
    params.require(:items).permit(:image_id, :name, :introduction, :price, :genre_id)
  end
end
