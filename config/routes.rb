Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  devise_for :admin, controllers: {
    sessions:      'admin/sessions'
  }
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
    get '/about' => 'homes#about'
    resources :addresses
    resources :cart_items
    resources :customers, only: [:edit, :update] do
    collection do
      get 'my_page', to: "customers#show"
    end
  end
    resources :items
    resources :orders
  end


end
