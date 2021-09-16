Rails.application.routes.draw do

    namespace :api do
      namespace :v1 do
        resources :users 
        post '/register' => "users#create"
        resources :journal_entries, only: [:index, :create]
    end
  end
end
