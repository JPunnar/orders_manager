# frozen_string_literal: true

class Order < ApplicationRecord
  VALID_STATUS = 'PAID'

  def as_json options={}
    {
      amount: { discount: discount, paid: paid, returns: returns, total: total },
      id: id,
      products: [],
      status: status
    }
  end
end
