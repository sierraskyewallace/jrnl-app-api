Rails.application.routes.draw do

    namespace :api do
      namespace :v1 do
        resources :users
        post '/users' => "users#create"
        #post '/login' => "users#login"
        resources :journal_entries, only: [:index, :create]
    end
  end
end
