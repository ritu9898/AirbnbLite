Rails.application.routes.draw do
  resources :sub_cats
  resources :cats
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
    get '/users/password/edit' => 'devise/passwords#edit'
   # ?post '/users' => 'users/registrations_controller#create'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # match 'users/:id' => "registrations#destroy", :via => :delete

  get 'airbnb/profile'
  root to:"airbnb#home" 

  resources :properties		
  resources :categories
  resources :sub_categories

  #get "/favourites/index" => "favourites#index"
  # delete "/favourites/destroy" => "favourites#destroy"

  resources :favourites do
    get 'add', on: :collection
  end
  # get 'categories/new'

end
