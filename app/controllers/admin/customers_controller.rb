class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.order("created_at DESC").page(params[:page]).reverse_order
  end

  def show
    @customers = Customer.find(params[:id])

  end

  def edit
    @customers = Customer.find(params[:id])
  end

  def update
    customers = Customer.find(params[:id])
    if customers.updated(customers_params)
      redirect_to admin_customer_path(customers)
    else
      render :edit
    end
  end

  private
  def customers_params
    params.require(:customers).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active)
  end

end

