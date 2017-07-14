Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root :controller => 'public', :action => 'index'
  get '/mon-compte', to: 'users#show'
  resources :articles
  resources :commentaries, :only => [:index, :new, :create]
  resources :categories, :only => [:index, :show]
  resources :users, :only => [:show, :new, :edit, :create, :update]
  resources :sessions, :onlyv => [:new, :create]

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