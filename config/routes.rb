Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :locations

  resources :events do
    resources :reviews, except: [:destroy]
  end

  resources :invites

  resources :groups

  resources :users do
    resources :reviews, except: [:destroy]
  end
  resources :reviews, only: [:destroy]

  get '/my-events', to: "users#my_events", as: "my_events"
  get '/my-friends', to: "users#my_friends", as: "my_friends"

  resources :favorites
  post '/add-to-wishlist', to: "favorites#add_to_wishlist", as: "add_to_wishlist"
end
