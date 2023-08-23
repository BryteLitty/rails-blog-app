require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:id/posts' do
    it 'the response status is correct' do
      get '/users/1/posts'
      expect(response.status).to eq(200)
    end

    it 'renders the correct index page' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      get '/users/1/posts'
      expect(response.body).to include('Here is a list of posts for a given user 1')
    end
  end
end
