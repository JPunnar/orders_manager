Rails.application.routes.draw do
  root to: 'errors#not_found'
  get '/404', to: 'errors#not_found'

  scope path: '/api' do
    resources :orders, only: [:create, :show, :update] do
      resources :products, only: [:index, :create, :update]
    end
    get '/products', to: 'sample_products#index'
  end
end
