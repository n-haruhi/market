Rails.application.routes.draw do

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'

    resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
  end

  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }

  namespace :public do
    root to: 'homes#top'

    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :show] do
      resources :cart_items, only: [:create, :update, :destroy]
    end
    resources :cart_items, only: [:index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
