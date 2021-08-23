Rails.application.routes.draw do
  devise_for :users
  get 'tweets/index'
  root to: "tweets#index"
  post '/tweets/guest_sign_in', to: 'tweets#new_guest'
  resources :tweets do
    collection do
      get 'search'
    end
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit]
end
