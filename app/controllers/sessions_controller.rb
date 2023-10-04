class SessionsController < ApplicationController
    skip_before_action :require_login, except: [:destroy]
  
    def new; end
  
    def create
      @user = login(params[:email], params[:password])
      if @user
        redirect_to workspaces_path, notice: 'ログインしました'
      else
        flash.now[:alert] = 'ログインできませんでした'
        render :new
      end
    end
  
    def destroy
      logout
      redirect_to login_path, notice: 'ログアウトしました。'
    end
end
  