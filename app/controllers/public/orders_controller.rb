class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def comfirm
     @order = Order.new(order_params)
     @address = Address.find(params[:order][:address_id])
     @order.postal_code = @address.postal_code
     @order.address = @address.address
     @order.name = @address.name
  end

  def complete

  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to order_path(@order)
  end

  def index
    @orders = Order.all
  end

  def show
  end

   private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :amount_billed, :payment_method)
  end
end
