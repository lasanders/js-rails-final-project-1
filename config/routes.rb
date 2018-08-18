Rails.application.routes.draw do
  # resources :purchases
   root 'users#home'


    get '/users' => 'users#new'

    post '/users' => 'users#create'

   get '/signin', to: 'sessions#new', as: 'signin'
   get '/auth/google_oauth2/callback' => 'sessions#other_create'
   post '/sessions', to: 'sessions#create'
   post '/auth/google_oauth2/callback' => 'sessions#other_create'
  #  get '/candies/:id/' => 'candies#show'
  #  post '/candies/:id/' => 'candies#show', as: 'js-next'
    get '/users/:id/candies' => 'users#candies', as: 'user_candies'
    post '/users/:id/candies' => 'users#candies'

   patch '/purchases', to: 'purchases#show'
   get '/signout', to: 'sessions#destroy'
   delete '/signout', to: 'sessions#destroy'
   get '/signout', to: 'sessions#other_destroy'
    delete '/signout', to: 'sessions#other_destroy'
   get '/delete', to: 'candies#destroy'
   post '/delete', to: 'candies#destroy'
  post '/purchases', to: 'purchases#create'

   resources :users do
       resources :purchases, only: [:show, :new]

     end

    resources :candies
    resources :users

    resources :purchases
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
