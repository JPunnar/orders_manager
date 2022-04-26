class ProductsController < ApplicationController

  before_action :load_order

  def index
    render json: @order.products.to_json
  end

  def create
    begin
      SampleProduct.find(params[:_json]).each do |sample_product|
        Product.create(
          name: sample_product.name,
          price: sample_product.price,
          product_id: sample_product.id,
          order_id: @order.id,
          quantity: 1
        )
      end
      response = 'OK'
    rescue ActiveRecord::RecordNotFound
      response = 'Invalid parameters'
    end

    render json: response.to_json
  end

  private

  def load_order
    @order = Order.find(params[:order_id])
  end
end
