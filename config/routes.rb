Rails.application.routes.draw do
  devise_for :users
  get 'tweets/index'
  root to: "tweets#index"
  get 'tweets/search'
  resources :tweets do
    resources :comments, only: [:new, :create]
  end
  resources :users, only: [:show]
end
