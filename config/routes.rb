Rails.application.routes.draw do
  scope path: '/api' do
    resources :orders
    get '/products', to: 'sample_products#index'
  end
end
