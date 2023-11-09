Rails.application.routes.draw do
  get 'static_page/terms_of_use'
  get 'static_page/privacy_policy'
  resources :users, only: %i[new create]

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy', as: 'logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :workspaces do
    collection do
      get 'list'
      get 'tag_filter'
      get 'search'
      get 'search_result' 
    end
    
    member do
      post 'create_favorite'
      delete 'destroy_favorite'
    end

    resources :reviews, only: [:new, :create, :edit, :update]
  end

  get 'terms_of_use', to: 'static_page#terms_of_use'
  get 'privacy_policy', to: 'static_page#privacy_policy'

  # Defines the root path route ("/")
  root 'pages#lp'
  resource :profile, only: %i[show edit update]
end
