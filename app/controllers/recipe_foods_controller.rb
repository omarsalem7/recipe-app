class RecipeFoodsController < ApplicationController
  def create
    recipe_foods = RecipeFood.new(quantity: params[:quantity])
    recipe_foods.food_id = params[:food_id]
    recipe_foods.recipe_id = params[:recipe_id]
    recipe_foods.save
    redirect_to recipe_path(params[:recipe_id])
    flash[:notice] = 'Ingredient added successfully'
  end
end
