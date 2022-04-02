Rails.application.routes.draw do  
  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index, :create]
      get '/users/:id', to: 'users#show'
      get 'users/:id/posts', to: 'users#posts'
      post '/users/:id/follow', to: 'users#follow'
      delete '/users/:id/unfollow', to: 'users#unfollow'
    end
  end
end
