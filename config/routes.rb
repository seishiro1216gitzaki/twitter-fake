Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  resources :users, only: [:index,:edit, :update] do
    member do
       get :following, :followers
    end
  resources :tweets, only: [:index, :create]
end
