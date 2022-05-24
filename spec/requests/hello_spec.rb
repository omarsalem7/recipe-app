require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #hello' do
    before(:each) do
      get '/'
    end

    it 'GET requests response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Find me in')
    end
  end
end
