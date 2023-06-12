Rails.application.routes.draw do
  devise_for :users

  resources :events, only: [:index, :new, :create]
  root to: 'events#index'
end
