class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:public]
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])

    @ingredients = RecipeFood.where(recipe_id: @recipe.id)
    @foods = Food.where(id: @ingredients.map(&:food_id))
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, alert: 'An error has occurred while creating the recipt, try again' }
      end
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
      else
        format.html { render :edit, alert: 'An error has occurred while updating the recipt' }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
    end
  end

  def public
    @public_recipes = Recipe.where(public: true)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
