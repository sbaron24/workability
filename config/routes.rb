Rails.application.routes.draw do
  root 'places#index'

  devise_for :users

  resources :places, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index]
  end

  namespace :api do
    namespace :v1 do
      resources :places, only: [:show] do
        resources :reviews, only: [:index]
      end
    end
  end
end
