Rails.application.routes.draw do
  
  resources :restaurants#, only: [:index, :show]
  # get '/restaurants', to: 'restaurants#index'
  
  # get :new_restaurants, to: 'restaurants#new' #, path: "ccc"
  
  # post '/restaurants_list', to: 'restaurants#list'
  root "restaurants#index"

  resources :users, only: [:create] do
    collection do
      get :sign_up, action: 'new'
    end
  end

  resources :sessions, path: "users", only: [] do
    collection do
      get :sign_in, action: "new"
      post :sign_in, action: "create"
      delete :sign_out, action: "destroy"
    end
  end


end
