Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]

  resources :attendances, only: [:create, :destroy]

  resources :events, only: [:index, :new, :create, :show]
  root to: 'events#index'
end
