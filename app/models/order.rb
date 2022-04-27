# frozen_string_literal: true

class Order < ApplicationRecord
  PAID_STATUS = 'PAID'

  has_many :products

  before_save :calculate_sums

  def as_json options={}
    {
      amount: { discount: discount, paid: paid, returns: returns, total: total },
      id: id,
      products: products,
      status: status
    }
  end

  def paid?
    status == PAID_STATUS
  end

  def calculate_sums
    self.total = products.sum do |p|
      if p.replaced_with.present?
        p.replaced_with['quantity'].to_d * p.replaced_with['price'].to_d
      else
        p.quantity * p.price
      end
    end
  end
end
