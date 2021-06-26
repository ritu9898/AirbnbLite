Rails.application.routes.draw do
  # resources :reviews
  resources :sub_cats
  resources :cats
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, :controllers => { :registrations => 'users/registrations' }

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
    get '/users/password/edit' => 'devise/passwords#edit'
     get 'change_password' => 'users/registrations#change_password'
    patch 'change_password' => 'users/registrations#change_password'
   # ?post '/users' => 'users/registrations_controller#create'

   # resources :dashboard
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # match 'users/:id' => "registrations#destroy", :via => :delete

  get 'airbnb/profile'
  get 'airbnb/about'
  get 'airbnb/game'
      
  # get 'airbnb/discount/:id', to: 'airbnb#game' 
    
    get 'airbnb/discount', to: 'airbnb#game' 


  root to:"airbnb#home" 

  # get '/card/new' => 'billing#new_card', as: :add_payment_method


  # get 'airbnb/home'

  resources :properties	do
    get 'search', on: :collection
    resources :bookings #do
      # get :billing, on: :collection
      # resources :billing
    # end
    resources :reviews do
      get 'rating', on: :collection
    end

  end	


  resources :categories
  resources :sub_categories

  #get "/favourites/index" => "favourites#index"
  # delete "/favourites/destroy" => "favourites#destroy"

  resources :favourites do
    get 'add', on: :collection
  end

  resources :dashboard

  resources :billing

  # resources :bookings
  # get 'categories/new'

end
