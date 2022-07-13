Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/y', as: 'rails_admin'
  devise_for :users
  scope '/admin' do 
    resources :users
  end
  resources :books
  resources :roles
 

  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'books#index'
end
