Rails.application.routes.draw do
  devise_for :users
  resources :recipes
 
  resources :users do
    resources :foods
  end

  resources :public_recipes, only: %i[index]
  resources :shopping_lists, only: %i[index]
  resources :recipe_foods, only: %i[new create destroy]
  

  root 'recipes#public'
end
