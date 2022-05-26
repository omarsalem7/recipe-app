require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :request do
  describe 'GET /destory' do
    it 'returns http success' do
      get '/recipe_foods/destory'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/recipe_foods/create'
      expect(response).to have_http_status(:success)
    end
  end
end
