Rails.application.routes.draw do
  root 'places#index'

  devise_for :users

  resources :places, only: [:index, :show, :new, :create, :edit, :update]

  namespace :api do
    namespace :v1 do
      resources :places, only: [:show]
    end
  end
end
