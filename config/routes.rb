Rails.application.routes.draw do
  root 'places#index'
  devise_for :users
  get "/places", to: "places#index"
  resources :places, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :places, only: [:show]
    end
  end
end
