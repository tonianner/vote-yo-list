Rails.application.routes.draw do
  root 'static_pages#index'

  namespace :api do
    resources :events,
      only: [:index, :show, :create, :update, :destroy],
      :defaults => {:format => 'json'} do
        resources :tasks,
          only: [:index, :show, :create, :update, :destroy],
          :defaults => {:format => 'json'}
      end
  end

end
