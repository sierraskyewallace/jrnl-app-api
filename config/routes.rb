Rails.application.routes.draw do

devise_for :users, :controllers => { :registrations => "api/v1/users", :sessions => "api/v1/users" }
devise_scope :user do
  #post 'api/v1/users/sign_in' => 'api/v1/users#sign_in'
  #get 'users/sign_in' => 'api/v1/users#index'
  post 'users' => 'api/v1/users#create'
 # post 'users' => 'api/v1/sessions#create'
    namespace :api do
      namespace :v1 do
        resources :users
        resources :journal_entries, only: [:index, :create]
    end
  end
end
end
