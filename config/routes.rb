Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items
    resources :orders
    resources :order_details
  end

  scope module: :public do
    root to: 'homes#top'
    resources :addresses
    resources :cart_items
    resources :costomers
    resources :items
    resources :orders
  end


end
