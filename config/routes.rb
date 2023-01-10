Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'home#index'
  resources :contacts, only: [:new, :create]
  resources :products, only: [:index, :show]
  resources :categories, only: [:index]

  post "products/add_to_cart/:id", to: "products#add_favourite_products", as: "add_favourite_products"
  delete "products/remove_from_cart/:id", to: "products#remove_favourite_products", as: "remove_favourite_products"
  get 'show_all_carts', to: 'home#show_all_carts'
  post "products/add_to_quantity/:id", to: "products#update_quantity", as: "update_quantity"
  get 'all_users', to: 'home#top_users'
  post 'follow_user', to: 'follows#follow_user'
  get 'product_details', to: 'contacts#product_details'
  post :checkout_session, to: 'contacts#checkout_session'
end
