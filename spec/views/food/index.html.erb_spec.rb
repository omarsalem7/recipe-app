require 'rails_helper'

RSpec.describe 'food/index.html.erb', type: :feature do
   describe 'Food#index' do
    before(:each) do
      @user = User.create!(name: 'Mphatso', email: 'mphatso@mail.com', password: 'password')
      food = Food.create!(name: 'Casava', measurement_unit: 'grams', price: 2, user_id: @user.id)

      visit new_user_session_path
      fill_in 'Email', with: 'mphatso@mail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit user_foods_path(user_id: @user.id)
    end

    it 'should display all the food details' do
      expect(page).to have_content 'Casava'
      expect(page).to have_content '$ 2'
    end

    it 'should display a delete button ' do
      within('table') do
        expect(find_all('button').length).to eq 1
      end
    end

    it ' Delete Food' do

      click_button 'Delete'

      expect(page).to_not have_content 'Casava'
    end
  end
end
