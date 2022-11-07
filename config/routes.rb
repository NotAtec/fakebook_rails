Rails.application.routes.draw do
  devise_for :users
  get 'about', to: 'static_pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :update, :edit] do
    member do
      post :request_friendship
      post :accept_friendship
      post :remove_friendship
    end
  end

  # Defines the root path route ("/")
  root "static_pages#about"
end
