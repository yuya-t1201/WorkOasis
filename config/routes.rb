Rails.application.routes.draw do
  get 'oauths/oauth'
  get 'oauths/callback'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'login', to: 'sessions#new'    # ログイン画面の表示
  post 'login', to: 'sessions#create' # ログインの処理
  delete 'logout', to: 'sessions#destroy' # ログアウトの処理
  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider

end
