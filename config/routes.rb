Rails.application.routes.draw do

  namespace :public do
    get 'top' => 'homes#top', as: 'top'

    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'

    resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
