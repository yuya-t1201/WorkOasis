class SessionsController < ApplicationController
    skip_before_action :require_login, except: [:destroy]
  
    def new; end
  
    def create
      @user = User.authenticate(params[:email], params[:password])
  
      if @user
        login(@user)
        redirect_to root_path, notice: 'ログインに成功しました。'
      else
        flash.now[:alert] = 'ログインに失敗しました'
        render :new, status: :unprocessable_entity
      end
    end
  
    def destroy
      logout
      redirect_to root_path, notice: 'ログアウトしました。'
    end
  end
  