Rails.application.routes.draw do


    namespace :api do
      namespace :v1 do
        devise_for :users, :controllers => { :registrations => "api/v1/users" }
        resources :journal_entries, only: [:index, :create]
    end
  end
end
