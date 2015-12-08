Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  root 'static_pages#index'

  namespace :api do
    resources :events,
      only: [:index, :show, :create, :update, :destroy],
      :defaults => {:format => 'json'} do
        resources :tasks,
          only: [:index, :show, :create, :update, :destroy],
          :defaults => {:format => 'json'}
        resources :locations,
          only: [:index, :show, :create, :update, :destroy],
          :defaults => {:format => 'json'}
      end
  end

end
