require 'rails_helper'

RSpec.describe 'recipe index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Omar', email: 'omara@gmail.com', password: '123455')
    @recipe = Recipe.create(name: 'hello', preparation_time: '4:00', cooking_time: '2:00', description: 'chocolat', public: true, user: @user)
    @food = Food.create(name: 'Mango', measurement_unit: 'grams', price: 3, user: @user)
    visit new_user_session_path
    fill_in 'Email', with: 'omara@gmail.com'
    fill_in 'Password', with: '123455'
    click_button 'Log in'
    visit recipes_path 
  end
  describe 'tests for view recipes#index' do
    it 'name of user.' do
      expect(page).to have_content 'Omar'
    end

    it 'see a header of table (name)' do
      expect(page).to have_content 'Name'
    end

    it 'see the recipes has Preparation time' do
        expect(page).to have_content 'Preparation time'
      end
  end
end