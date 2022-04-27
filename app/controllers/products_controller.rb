class ProductsController < ApplicationController

  before_action :load_order

  def index
    render json: @order.products.to_json
  end

  def create
    begin
      SampleProduct.find(params[:_json]).each do |sample_product|
        product_in_cart = @order.products.find_by(product_id: sample_product.id)
        if product_in_cart.present?
          product_in_cart.increment!(:quantity)
        else
          Product.create(
            name: sample_product.name,
            price: sample_product.price,
            product_id: sample_product.id,
            order_id: @order.id,
            quantity: 1
          )
        end
      end
      response = 'OK'
    rescue ActiveRecord::RecordNotFound
      response = 'Invalid parameters'
    end

    render json: response.to_json
  end

  def update
    product = @order.products.find(params[:id])
    if params[:quantity].to_i.positive?
      product.update(quantity: params[:quantity])
      response = 'OK'
    elsif replace_order?
      sample_product = SampleProduct.find(params[:replaced_with][:product_id])
      replacement_product = Product.create(
        name: sample_product.name,
        price: sample_product.price,
        product_id: sample_product.id,
        quantity: params[:replaced_with][:quantity]
      )
      product.update(replaced_with: replacement_product)
      response = "OK"
    else
      response = 'Invalid parameters'
    end
    render json: response.to_json
  end

  private

  def replace_order?
    params[:replaced_with].present? &&
    params[:replaced_with][:quantity].to_i.positive? &&
    @order.paid?
  end

  def load_order
    @order = Order.find(params[:order_id])
  end
end
