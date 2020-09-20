Rails.application.routes.draw do
   root 'home/users'
  resources :users
  resources :skatespots
  resources :comments 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
