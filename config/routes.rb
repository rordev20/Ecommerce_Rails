Rails.application.routes.draw do
  root :to => 'home#index'
  devise_for :users
  ActiveAdmin.routes(self)
  resources :products, only: [:index, :show]
  resources :carts, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy] do
    member do
      post :increase_quantity
      post :decrease_quantity
    end
  end

  resources :orders, only: [:new, :create]
  get "/orders/:order_id/confirm" => "orders#confirm_order", as: :confirm_order
  match "/coupons/apply" => "coupons#apply", as: :apply_coupon, via: [:get, :post]
  post "/coupons/cancel_coupon" => "coupons#cancel_coupon", as: :cancel_coupon
end
