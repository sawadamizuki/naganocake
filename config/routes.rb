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
    resources :cart_items, only: [:index, :update, :destroy, :create] do
    collection do
      delete 'destroy_all', to: "cart_items#destroy_all"
    end
    end
    resources :customers, only: [:edit, :update] do
    collection do
      get 'my_page', to: "customers#show"
    end
    end
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :index, :show, :create] do
    collection do
      post 'comfirm', to: 'orders#confirm'
    end
    end
    get '/orders', to: 'orders#complete'
  end


end
