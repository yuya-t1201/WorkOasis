class WorkspacesController < ApplicationController
  def index
    @workspaces = Workspace.all
  end

  def new
    @workspace = Workspace.new
  end

  def show
    @workspace = Workspace.find(params[:id])
  end


  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.user = current_user

    if @workspace.save
      redirect_to workspace_path(@workspace), notice: 'ワークスペースが登録されました'
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
