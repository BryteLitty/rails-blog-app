Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments , :likes
    end
  end  
end
