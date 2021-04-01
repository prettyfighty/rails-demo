Rails.application.routes.draw do
  
  resources :restaurants#, only: [:index, :show]

  # get '/restaurants', to: 'restaurants#index'
  
  # get :new_restaurants, to: 'restaurants#new' #, path: "ccc"

  # post '/restaurants_list', to: 'restaurants#list'

end
