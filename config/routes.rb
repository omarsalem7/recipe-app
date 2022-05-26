Rails.application.routes.draw do
  get 'shopping_lists/index'
  devise_for :users
  resources :recipes
  get '/public_recipes', to: 'recipes#public'
  resources :users do
    resources :foods
  end

  root 'recipes#public'
end
