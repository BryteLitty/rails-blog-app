require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  # for the index template
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

  # for the show template
  describe 'GET /users/:id/posts/:post_id' do
    it 'the response status is correct' do
      get '/users/1/posts/2'
      expect(response.status).to eq(200)
    end

    it 'renders the correct show template' do
      get '/users/1/posts/3'
      expect(response.body).to render_template(:show)
    end

    it 'includes the correct placeholder text' do
      get '/users/1/posts'
      expect(response.body).to include('Here is a list of posts for a given user 1')
    end
  end
end
