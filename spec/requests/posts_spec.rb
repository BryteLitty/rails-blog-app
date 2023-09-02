require 'rails_helper'

describe 'POSTS CONTROLLER' do
  describe 'get index' do
    it 'returns http succes' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
    end

    it 'return the correct template' do
      get '/users/1/posts'
      expect(response).to render_template('index')
    end

    it 'return http success for /users/:user_id/posts/:id' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
    end

    it 'return the correct template' do
      get '/users/1/posts/1'
      expect(response).to render_template('show')
    end
  end
end
