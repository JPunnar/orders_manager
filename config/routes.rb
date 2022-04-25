Rails.application.routes.draw do
  root to: 'errors#not_found'
  get '/404', to: 'errors#not_found'

  scope path: '/api' do
    resources :orders
    get '/products', to: 'sample_products#index'
  end
end
