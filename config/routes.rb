Rails.application.routes.draw do
  root 'home#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :articles
  resources :commentaries
  resources :categories
  resources :images
  resources :users

end
