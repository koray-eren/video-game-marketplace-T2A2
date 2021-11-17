Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  resources :listings
  get 'my-listings', to: 'listings#my_listings'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end