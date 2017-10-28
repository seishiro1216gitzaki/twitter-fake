Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  resources :users, only: [:index,:edit, :update, :show] do
    member do
       get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :tweets, only: [:index, :create, :destroy] do
    resources :watch_laters, only: [:create]
  end
  resources :watch_laters, only: [:destroy]
end
