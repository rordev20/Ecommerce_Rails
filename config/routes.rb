Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  resources :products, only: [:index, :show]
  resources :carts, only: [:index]
  root :to => "products#index"
end
