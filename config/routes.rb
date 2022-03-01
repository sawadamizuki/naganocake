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
    resources :items, only: [:inde, :new, :create, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :cart_items, only: [:index, :update, :destroy, :create] do
    collection do
      delete 'destroy_all', to: "cart_items#destroy_all"
    end
    end
    resources :customers, only: [:edit, :update] do
    collection do
      get 'my_page', to: "customers#show"
      get 'unsubscribe', to: "customers#unsubscribe"
      patch 'withdraw', to: "customers#withdraw"
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