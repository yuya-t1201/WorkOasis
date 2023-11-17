Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  get 'static_page/terms_of_use'
  get 'static_page/privacy_policy'
  resources :users, only: %i[new create]

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy', as: 'logout'

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

  root 'pages#lp'
  resource :profile, only: %i[show edit update]
end
