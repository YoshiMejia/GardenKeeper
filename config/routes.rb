Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users, :plants, :gardens, only: [:new, :create, :show]
end

# login GET    /login      sessions#new
#         POST   /login      sessions#create
# signup GET    /signup      users#new
#         POST   /signup      users#create

# users POST   /users      users#create
# new_user GET    /users/new      users#new
# user GET    /users/:id          users#show

# plants POST   /plants      plants#create
# new_plant GET    /plants/new      plants#new
#  plant GET    /plants/:id       plants#show

# gardens POST   /gardens      gardens#create
# new_garden GET    /gardens/new      gardens#new
# garden        GET    /gardens/:id            gardens#show