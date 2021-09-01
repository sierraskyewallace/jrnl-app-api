Rails.application.routes.draw do

    namespace :api do
      namespace :v1 do
        post '/login', to: 'auth#create'
        get '/profile', to: 'users#profile'
        resources :users, only: [:index, :create]
        resources :journal_entries, only: [:index, :create]
    end
  end
end
