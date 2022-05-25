Rails.application.routes.draw do
  devise_for :users
  resources :recipes

  resources :users do
    resources :foods
  end

  root 'recipes#index'
end
