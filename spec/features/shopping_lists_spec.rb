require 'rails_helper'

RSpec.describe 'recipe index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Omar', email: 'omara@gmail.com', password: '123455')
    @recipe = Recipe.create(name: 'hello', preparation_time: '4:00', cooking_time: '2:00', description: 'chocolat',
                            public: true, user: @user)
    @food = Food.create(name: 'Mango', measurement_unit: 'grams', price: 3, user: @user)
    @food_recipe = RecipeFood.create(quantity: 4, recipe_id: @recipe.id, food_id: @food.id)
    visit new_user_session_path
    fill_in 'Email', with: 'omara@gmail.com'
    fill_in 'Password', with: '123455'
    click_button 'Log in'
    visit shopping_lists_path
  end
  describe 'tests for view recipes#show' do
    it 'spec for show page and see ingredients' do
      expect(page).to have_content 'Food'
      expect(page).to have_content 'Quantity'
      expect(page).to have_content 'Price'
      expect(page).to have_content 'Total value of food needed:'
      expect(page).to have_content 'Amount of food items to buy:'
    end

    it ' Delete Food' do
      click_button 'Sign out'

      expect(page).to have_content 'Sign in'
    end
  end
end
