Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #do i need to erase users_path (users#index) ?
  root 'sessions#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  #should i add users/:id/plants? AND/OR users/:id/plots?
  #maybe users homepage should just have links to
  #their plots etc


  resources :users, :gardens, :plants, :plots, only: [:new, :index, :create]
  #users/id:/gardens...
  resources :users, only: [:show, :index] do
    resources :gardens, only: [:new, :index, :create]
  end

  #gardens/id:/plots...
  resources :gardens, only: [:show, :index] do
    resources :plots, only: [:new, :index, :create]
  end

#gardens/id:/plants
  resources :gardens, only: [:show, :index] do 
    resources :plants, only: [:new, :index, :create]
  end


end#ender


# login GET    /login                         sessions#new
#                  POST   /login                         sessions#create
#           logout DELETE /logout                        sessions#destroy

#           signup GET    /signup                        users#new
#                  POST   /signup                        users#create

#            users GET    /users                         users#index
#                  POST   /users                         users#create
#         new_user GET    /users/new                     users#new

#          gardens GET    /gardens                       gardens#index
#                  POST   /gardens                       gardens#create
#       new_garden GET    /gardens/new                   gardens#new

#           plants GET    /plants                        plants#index
#                  POST   /plants                        plants#create
#        new_plant GET    /plants/new                    plants#new

#            plots GET    /plots                         plots#index
#                  POST   /plots                         plots#create
#         new_plot GET    /plots/new                     plots#new

#     user_gardens GET    /users/:user_id/gardens        gardens#index
#                  POST   /users/:user_id/gardens        gardens#create
#  new_user_garden GET    /users/:user_id/gardens/new    gardens#new
#                  GET    /users                         users#index
#             user GET    /users/:id                     users#show

#     garden_plots GET    /gardens/:garden_id/plots      plots#index
#                  POST   /gardens/:garden_id/plots      plots#create
#  new_garden_plot GET    /gardens/:garden_id/plots/new  plots#new
#                  GET    /gardens                       gardens#index
#           garden GET    /gardens/:id                   gardens#show
#    garden_plants GET    /gardens/:garden_id/plants     plants#index
#                  POST   /gardens/:garden_id/plants     plants#create
# new_garden_plant GET    /gardens/:garden_id/plants/new plants#new
#                  GET    /gardens                       gardens#index
#                  GET    /gardens/:id                   gardens#show