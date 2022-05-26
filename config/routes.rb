Rails.application.routes.draw do
  resources :recipe_foods, only: [:create, :destroy]
  devise_for :users
  resources :recipes
  get '/public_recipes', to: 'recipes#public'
  resources :users do
    resources :foods
  end

  root 'recipes#public'
end
