Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'sessions#main'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # get '/user/home', to: 'users#home', as: 'homepage'
  #OR
  get '/homepage', to: 'users#home', as: 'homepage'

  get '/plants/celebrity', to: 'plants#celebrity', as: 'celebrity'
  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  resources :users, :gardens, only: [:new, :index, :create, :show]
  resources :plants, only: [:index, :show]

  resources :users, only: [:show, :index] do
    resources :gardens, only: [:new, :create, :index, :show]
  end

end#ender
