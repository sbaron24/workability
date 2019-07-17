Rails.application.routes.draw do
  root 'places#index'
  devise_for :users
  
  resources :places, only: [:index]
end
