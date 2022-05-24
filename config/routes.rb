Rails.application.routes.draw do
  devise_for :users
  get 'pages/hello'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :foods
  end
  root to: 'pages#hello'


end
