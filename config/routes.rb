Rails.application.routes.draw do
  resources :recipe_foods, only: [:create, :destroy]
  devise_for :users
  resources :recipes
  get '/public_recipes', to: 'recipes#public'
  resources :users do
    resources :foods
  end

  resources :public_recipes, only: %i[index]
  resources :shopping_lists, only: %i[index]
  resources :recipe_foods, only: %i[new create destroy]
  

  root 'recipes#public'
end
