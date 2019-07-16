Rails.application.routes.draw do
  root 'places#index'
  devise_for :users
  get "/places", to: "places#index"
  resources :places, only: [:index]
end
