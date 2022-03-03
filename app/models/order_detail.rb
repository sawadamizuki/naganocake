class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  def subtotal
    with_tax_price * amount
  end

  def with_tax_price
    (price * 1.1).floor
  end

end
