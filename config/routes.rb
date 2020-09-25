Rails.application.routes.draw do
  get '/signup', to: 'users#new' 
  #login routes
  #get '/login', to: 'sessions/new'
  #post '/login', to: 'sessions/create'
  #get 'sessions/destroy'
  
  resources :users
  resources :skatespots
  resources :comments 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
