require 'rails_helper'

RSpec.describe 'Users', type: :request do
  # for the index template
  describe 'GET /users' do
    it 'response status is correct' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      get '/users'
      expect(response.body).to include('List of users')
    end
  end

  # for the show template
  describe 'GET #show' do
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
