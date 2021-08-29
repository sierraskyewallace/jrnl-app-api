Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :users, only: [:index, :create]
        post '/login', to: 'auth#create'
        resources :journal_entries, only: [:index, :create]
      end
    end
end
