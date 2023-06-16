Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'login', to: 'sessions#new'    # ログイン画面の表示
  post 'login', to: 'sessions#create' # ログインの処理
  delete 'logout', to: 'sessions#destroy' # ログアウトの処理

end
