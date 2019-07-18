Rails.application.routes.draw do
  root 'places#index'

  devise_for :users

  resources :places, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :new, :create]
  end

  namespace :api do
    namespace :v1 do
      resources :places, only: [:show]
    end
  end
end
