Rails.application.routes.draw do  
  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index, :create]
      get '/users/:id', to: 'users#show'
      post '/users/:id/follow', to: 'users#follow'
      delete '/users/:id/unfollow', to: 'users#unfollow'
    end
  end
end
