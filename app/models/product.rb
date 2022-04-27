class Product < ApplicationRecord
  belongs_to :order
  after_save :calculate_order_sums

  def calculate_order_sums
    order&.save
  end

  def replace_product(replacement_product)
    self.update(replaced_with: replacement_product)
    if total_price < replacement_product.total_price
      order.discount = replacement_product.total_price - total_price
    else
      order.returns = total_price - replacement_product.total_price
    end
    order.save
  end

  def total_price
    quantity * price
  end

  def as_json options={}
    {
      id: id,
      name: name,
      price: price,
      product_id: product_id,
      quantity: quantity,
      replaced_with: replaced_with
    }
  end
end
