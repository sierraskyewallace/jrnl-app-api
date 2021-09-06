Rails.application.routes.draw do

    namespace :api do
      namespace :v1 do
        post '/login', to: 'auth#create'
        resources :users, only: [:index, :create] do
        
        #get '/profile', to: 'users#profile'
        resources :journal_entries, only: [:index, :create]
    end
  end
end
end