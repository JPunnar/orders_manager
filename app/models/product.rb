class Product < ApplicationRecord

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
