Rails.application.routes.draw do
  resources :articles
  resources :commentaries
  resources :categories
  resources :images
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'


end
