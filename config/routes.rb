Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root :controller => 'public', :action => 'index'
  resources :articles
  resources :commentaries
  resources :categories
  resources :images
  resources :users
  resources :sessions

  namespace :admin do
    root :controller => 'admin', :action => 'index'
    resources :articles
    resources :commentaries
    resources :categories
    resources :images
    resources :users
    resources :sessions
  end
end