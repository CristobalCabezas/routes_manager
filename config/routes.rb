Rails.application.routes.draw do
  get '/api/v1/vehicles', to: 'api/v1/vehicles#index'
  post '/api/v1/vehicles', to: 'api/v1/vehicles#create'
  get '/api/v1/delivery_orders', to: 'api/v1/delivery_orders#index'
  post '/api/v1/delivery_orders', to: 'api/v1/delivery_orders#create'
  post '/api/v1/routes', to: 'api/v1/routes#create'
  post '/api/v1/routes/:id/assign_order', to: 'api/v1/routes#assign_order'
  get '/api/v1/routes/:id', to: 'api/v1/routes#show'
  patch '/api/v1/routes/:id', to: 'api/v1/routes#update'
end
