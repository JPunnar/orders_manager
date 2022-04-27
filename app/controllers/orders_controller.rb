class OrdersController < ApplicationController

  def create
    order = Order.create
    render json: order.to_json
  end

  def show
    render json: Order.find(params[:id]).to_json
  end

  def update
    if order_params['status'] == Order::PAID_STATUS
      order = Order.find(params[:id])
      order.update(status: Order::PAID_STATUS, paid: order.total)
      response = 'OK'.to_json
    else
      response = "Invalid order status".to_json
    end

    render json: response
  end

  def order_params
    @orders_params ||= JSON.parse(request.body.read)
  end
end
