class WorkspacesController < ApplicationController
  def index
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.user_id = current_user.id
  
    if @workspace.save
      redirect_to workspaces_path, notice: 'ワークスペースが登録されました'
    else
      render :new
    end
  end

  private

  def workspace_params
    params.require(:workspace).permit(:title, :address, :price, :recommendation)
  end
end
