Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :users, only: %i[new create]

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy', as: 'logout'
  post '/guest_login', to: 'sessions#guest_login'


  resources :workspaces do
    collection do
      get 'list'
      get 'tag_filter'
      get 'search'
      get 'search_result'
    end

    resources :favorites, only: [:create, :destroy]
    resources :reviews, only: [:new, :create, :edit, :update]
  end

  get 'terms_of_use', to: 'static_page#terms_of_use'
  get 'privacy_policy', to: 'static_page#privacy_policy'

  root 'pages#lp'
  resource :profile, only: %i[show edit update]
end
