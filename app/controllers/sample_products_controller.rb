class SampleProductsController < ApplicationController
  
  def index
    render json: SampleProduct.all.to_json(only: [:id, :name, :price])
  end
end
