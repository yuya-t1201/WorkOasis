Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  resources :users, only: %i[new create]

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy', as: 'logout'
  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "users/auth/google/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :workspaces do
    collection do
      get 'list'
    end
    
    member do
      post 'create_favorite'
      delete 'destroy_favorite'
    end

    resources :reviews, only: [:new, :create]
  end

  # Defines the root path route ("/")
  root 'pages#lp'
  resource :profile, only: %i[show edit update]
end
