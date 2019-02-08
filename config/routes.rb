Rails.application.routes.draw do
  resources :tournaments, only: [:index, :new, :create, :show, :destroy]
  resources :players
  resources :games, only: [:show]
  resources :rounds, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
