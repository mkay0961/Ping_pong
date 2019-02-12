Rails.application.routes.draw do
  resources :users
  resources :tournaments, only: [:index, :new, :create, :show, :destroy]
  resources :players
  resources :games, only: [:show]
  resources :rounds, only: [:show]
  patch '/games/:id', to: 'games#set_winner'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: [:new, :create]
  root 'welcome#root'
  get "/home", to: "welcome#home"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
