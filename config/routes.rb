Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get 'about', to: 'static_pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :update, :edit] do
    member do
      post :request_friendship
      post :accept_friendship
      post :remove_friendship
    end
    get :friends
  end

  resources :notifications, only: [:destroy]
  resources :likes, only: [:create, :destroy]

  # Defines the root path route ("/")
  root "static_pages#about"
end
