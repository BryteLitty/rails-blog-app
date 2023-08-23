require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct show page' do
      get '/users/1'
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text' do
      get '/users/1'
      expect(response.body).to include('Users ID: 1')
    end
  end
end
