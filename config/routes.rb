Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  resources :products, only: [:index, :show]
  resources :carts, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]
  resources :orders, only: [:new, :create]
  root :to => "products#index"
end
