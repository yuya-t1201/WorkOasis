class SessionsController < ApplicationController
    skip_before_action :require_login, except: [:destroy]
  
    def new; end
  
    def create
      @user = User.authenticate(params[:email], params[:password])
  
      if @user
        if login(params[:email], params[:password])
          redirect_to workspaces_path, notice: 'ログインしました'
        else
          flash.now[:alert] = 'ログインに失敗しました'
          render :new
        end
      end
    end
  
    def destroy
      logout
      redirect_to login_path, notice: 'ログアウトしました。'
    end
end
  