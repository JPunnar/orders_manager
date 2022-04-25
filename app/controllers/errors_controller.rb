class ErrorsController < ActionController::Base
  def not_found
    render json: { errors: { detail: 'Not Found' } }.to_json, status: 404
  end
end
