Rails.application.routes.draw do


  root to: "sessions#home"

    namespace :api do
      namespace :v1 do
        post '/register' to: "users#create"
        post '/login' to: "users#login"
        resources :journal_entries, only: [:index, :create]
    end
  end
end
end
