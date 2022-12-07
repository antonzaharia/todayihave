Rails.application.routes.draw do
  resources :tags
  resources :posts
  root 'home#index'
  get :dashboard, to: 'home#dashboard'

  resource :users, only: [:show, :new, :create]
  resource :sessions, only: [:new, :create, :destroy]
end
