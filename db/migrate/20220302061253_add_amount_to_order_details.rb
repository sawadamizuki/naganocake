class AddAmountToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :amount, :integer
  end
end
