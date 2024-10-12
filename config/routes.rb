Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  devise_scope :user do
    unauthenticated do
      root to: 'users/sessions#new', as: 'unauthenticated_user_root'
    end

    authenticated do
      root to: "projects#index", as: 'authenticated_user_root'

      resources :project_statuses
      resources :comments
      resources :user_projects
      resources :projects
      resources :users
    end
  end
end
