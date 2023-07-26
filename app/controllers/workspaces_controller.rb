class WorkspacesController < ApplicationController
  def index
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.user = current_user

    if @workspace.save
      redirect_to workspaces_path, notice: 'ワークスペースが登録されました'
    else
      puts @workspace.errors.inspect  # ログにエラーメッセージを出力
      render :new
    end
  end

  private

  def workspace_params
    params.require(:workspace).permit(:title, :address, :price, :recommendation, :workspace_image)
  end

end
