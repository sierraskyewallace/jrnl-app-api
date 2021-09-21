Rails.application.routes.draw do

devise_for :users, :controllers => { :registrations => "api/v1/users", :sessions => "api/v1/users" }
devise_scope :user do
    namespace :api do
      namespace :v1 do
        post '/users', to: 'users#create'
        resources :journal_entries, only: [:index, :create]
    end
  end
end
end