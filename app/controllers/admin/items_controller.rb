class Admin::ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def new
    @item = Item.new

  end

  def create
    @item = Item.new(item_params)
    if  @item.save!
     redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
     redirect_to  admin_items_path
    else
     redirect_to :edit
    end
  end

private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price)
  end

end
