Rails.application.routes.draw do
  root :to => 'home#index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  ActiveAdmin.routes(self)
  resources :products, only: [:index, :show]
  resource :cart, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy] do
    member do
      post :increase_quantity
      post :decrease_quantity
    end
  end

  namespace :admin do
    get '/get_sub_category_attributes', to: 'products#get_sub_category_attributes'
    get '/get_category_sizes', to: 'products#get_category_sizes'
  end
  resources :orders, only: [:new, :create]
  resources :addresses, only: [:edit, :update, :destroy]
  resources :users, only: [:update]
  get 'user/orders', to: 'users#orders'
  get 'user/addresses', to: 'users#addresses'
  get 'user/account', to: 'users#account'
  get 'user/wallet', to: 'users#wallet'
  get 'user/my_coupon', to: 'users#my_coupon'
  get "/orders/:order_id/confirm" => "orders#confirm_order", as: :confirm_order
  match "/coupons/apply" => "coupons#apply", as: :apply_coupon, via: [:get, :post]
  post "/coupons/cancel_coupon" => "coupons#cancel_coupon", as: :cancel_coupon
end
