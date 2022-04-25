class OrdersController < ApplicationController

  def create
    order = Order.create
    render json: order.to_json
  end
end
