Rails.application.routes.draw do
  namespace :public do
    get 'top' => 'homes#top', as: 'top'

    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]

  end

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'

    resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
