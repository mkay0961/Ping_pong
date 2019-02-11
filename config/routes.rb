Rails.application.routes.draw do
  resources :tournaments, only: [:index, :new, :create, :show, :destroy]
  resources :players
  resources :games, only: [:show]
  resources :rounds, only: [:show]
  patch '/games/:id', to: 'games#set_winner'
  root 'tournaments#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
