# frozen_string_literal: true

class Order < ApplicationRecord
  PAID_STATUS = 'PAID'

  has_many :products

  def as_json options={}
    {
      amount: { discount: discount, paid: paid, returns: returns, total: total },
      id: id,
      products: products,
      status: status
    }
  end

  def total
    products.sum { |p| p.quantity * p.price }
  end

  def paid?
    status == PAID_STATUS
  end
end
