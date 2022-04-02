Rails.application.routes.draw do  
  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index, :create]
      post '/users/:id/follow', to: 'users#follow'
      delete '/users/:id/unfollow', to: 'users#unfollow'
    end
  end
end
