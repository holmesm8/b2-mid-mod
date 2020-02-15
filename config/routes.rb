Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/studios', to: 'studios#index'
  get '/actors/:actor_id', to: 'actors#show'
  get '/movies/:movie_id', to: 'movies#show'
  post '/actormovies/:movie_id', to: 'actormovies#create'
end
