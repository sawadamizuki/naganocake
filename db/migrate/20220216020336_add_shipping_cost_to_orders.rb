class AddShippingCostToOrders < ActiveRecord::Migration[5.2]
  def change
    # t.integer :shipping_cost, default: 800
    add_column :orders, :shipping_cost, :integer, default: 800
  end
end
