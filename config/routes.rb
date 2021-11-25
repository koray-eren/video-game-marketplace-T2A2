Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  resources :listings
  get 'listings/:id/purchase', to: 'listings#purchase', as: 'purchase_listing'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end