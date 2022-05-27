require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = User.create(name: 'Omar', email: 'omara@gmail.com', password: '123455')
    expect(@user).to be_valid
    @recipe = Recipe.create(name: 'hello', preparation_time: '4:00', cooking_time: '2:00', description: 'chocolat',
                            public: true, user: @user)
    @food = Food.create(name: 'Mango', measurement_unit: 'grams', price: 3, user: @user)
    @recipe_food = RecipeFood.create(quantity: 2, recipe: @recipe, food: @food)
  end

  it 'spec create a recipefood' do
    expect(@recipe_food).to be_valid
    expect(@recipe_food.quantity).to eq 2
    expect(@recipe_food.recipe).to eq @recipe
    expect(@recipe_food.food).to eq @food
  end
end
