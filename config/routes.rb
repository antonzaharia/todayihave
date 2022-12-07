Rails.application.routes.draw do
  root "home#index"
  get :dashboard, to: "home#dashboard"

  resource :users, only: [:show, :new, :create]
  resource :sessions, only: [:new, :create, :destroy]
  resources :tags, only: [:index, :show]
  resources :posts, only: [:show, :new, :create]
end
