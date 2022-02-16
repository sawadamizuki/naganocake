class AddAmountBilledToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :amount_billed, :integer
  end
end
