Rails.application.routes.draw do
  devise_for :users
  get 'about', to: 'static_pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end