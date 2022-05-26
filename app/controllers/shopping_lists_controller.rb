class ShoppingListsController < ApplicationController
  def index
    @recipes = Recipe.all
    @ingredients = RecipeFood.where(recipe_id: @recipes.map(&:id))
    @foods = Food.where(id: @ingredients.map(&:food_id))
  end

  def total_price
    price = 0
    @ingredients.each do |recipe_food|
      price += Food.find(recipe_food.food_id).price * recipe_food.quantity
    end
    price
  end

  helper_method :total_price
  
end
