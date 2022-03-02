class AddIsActivToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :is_activ, :integer
  end
end
