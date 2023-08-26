Rails.application.routes.draw do
  #roots route
  root 'users#index'

  # users route
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'
  
  # posts routes
  # get 'users/:id/posts', to: 'posts#index', as 'user_posts'
  get '/users/:id/posts', to: 'posts#index', as: 'user_posts'
  get '/users/:id/posts/:post_id', to: 'posts#show', as: 'post'

end
