class OrdersController < ApplicationController

  def create
    order = Order.create
    render json: order.to_json
  end

  def show
    render json: Order.find(params[:id])
  end
end
