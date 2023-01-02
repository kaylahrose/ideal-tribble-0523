Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/studios', to: 'studios#index'
  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'
  post '/movies/:id/actors', to: 'actor_movies#create'
end
