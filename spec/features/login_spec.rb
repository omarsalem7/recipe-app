require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before(:each) do
    User.create(name: 'Omar', email: 'omara@gmail.com', password: '123455')
    visit user_session_path
  end
  describe 'tests for view login' do
    it 'I can see the username and password inputs and the Submit button.' do
      expect(page).to have_field(type: 'email')
      expect(page).to have_field(type: 'password')
      expect(page).to have_button(type: 'submit')
    end

    it 'sign me in' do
      visit new_user_session_path
      fill_in 'Email', with: 'omara@gmail.com'
      fill_in 'Password', with: '123455'
      click_button 'Log in'
      expect(page).to have_content 'Public recipes'
    end

    it 'with incorrect data, I am redirected to the sign in page' do
      visit new_user_session_path
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(current_path).to eq '/users/sign_in'
    end

    it 'with correct data, I am redirected to the root page' do
      visit new_user_session_path
      fill_in 'Email', with: 'omara@gmail.com'
      fill_in 'Password', with: '123455'
      click_button 'Log in'
      expect(current_path).to eq root_path
    end
  end
end
