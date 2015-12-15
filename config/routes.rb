Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  root 'static_pages#index'

  namespace :api do
    resources :events, only: [:index, :show, :create, :update, :destroy] do
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
      put '/locations/:id/vote', to: "locations#vote"
      resources :locations, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:index]
    end
  end
end
