class WorkspacesController < ApplicationController
  def index
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(workspace_params)
    if @workspace.save
      redirect_to workspaces_path, notice: "ワークスペースが登録されました。"
    else
      render :new
    end
  end

  private

  def workspace_params
    params.require(:workspace).permit(:name, :address, :tags, :price, :recommendation, :workspace_image, :workspace_image_cache)
  end
end
