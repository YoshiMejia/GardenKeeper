Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #do i need to erase users_path (users#index) ?
  root 'sessions#main'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/user/home', to: 'users#home', as: 'homepage'

  resources :users, :gardens, :plants, only: [:new, :index, :create, :show]

  resources :users, only: [:show, :index] do
    resources :gardens, only: [:new, :index, :create, :show]
  end

  resources :users, only: [:show, :index] do
    resources :plants
  end


end#ender
