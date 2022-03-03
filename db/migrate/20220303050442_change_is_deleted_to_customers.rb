class ChangeIsDeletedToCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :customers, :is_deleted, false, false
    change_column_default :customers, :is_deleted, from: nil, to: false
  end
end
