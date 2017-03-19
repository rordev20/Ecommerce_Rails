Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  resources :products, only: [:index, :show]
  resources :carts, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]
  resources :orders, only: [:new, :create]
  root :to => "products#index"
  get "/orders/:order_id/confirm" => "orders#confirm_order", as: :confirm_order
end
