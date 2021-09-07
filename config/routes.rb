Rails.application.routes.draw do


  root to: "sessions#home"

    namespace :api do
      namespace :v1 do
        resources :users do
        resources :journal_entries, only: [:index, :create]
    end
  end
end
end
