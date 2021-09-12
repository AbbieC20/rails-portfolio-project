Rails.application.routes.draw do
  root "static_pages#home"
  resources :events do 
    resources :users, only: [:index]
  end
  resources :users, only: [:new, :create]
  resources :organisers
  resources :sponsors
  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/logout', to: 'session#destroy'
  post '/bookings', to: 'bookings#create'
  match '/auth/:provider/callback', to: 'session#create', via: [:get, :post]
end


