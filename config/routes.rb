Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  get '/public_recipes', to: 'recipes#public'
  resources :users do
    resources :foods
  end

  root 'recipes#index'
end
