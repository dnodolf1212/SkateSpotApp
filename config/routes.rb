Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  #root '/home'
  resources :users
  resources :skatespots
  resources :comments 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
