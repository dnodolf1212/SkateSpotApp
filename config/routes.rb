Rails.application.routes.draw do
  #get 'site/index'
  root 'site#welcome'
  #signup routes
  get '/signup', to: 'users#new' 
  #login routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#facebook'
  #match '/auth/facebook/callback', to: 'sessions#create', via: [:get, :post]
  #logout route
  delete '/logout', to: 'sessions#destroy'
  
  resources :users, except: [:edit, :destroy]
  
  resources :skatespots do  
    resources :comments, except: [:show]
  end
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
