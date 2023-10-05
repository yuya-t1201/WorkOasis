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
      render :new
    end
  end

  def list
    if params[:latest]
      @workspaces = Workspace.latest.page(params[:page]).per(10)
    elsif params[:old]
      @workspaces = Workspace.old.page(params[:page]).per(10)
    elsif params[:highest_rated]
      @workspaces = Workspace.highest_rated.page(params[:page]).per(10)
    else
      @workspaces = Workspace.latest.page(params[:page]).per(10)
    end
  end

  def create_favorite
    @workspace = Workspace.find(params[:id])
    current_user.likes.create(workspace: @workspace)
    redirect_to @workspace, notice: 'ワークスペースをお気に入りに追加しました'
  end

  def destroy_favorite
    @workspace = Workspace.find(params[:id])
    current_user.likes.find_by(workspace: @workspace).destroy
    redirect_to @workspace, notice: 'ワークスペースのお気に入りを解除しました'
  end

  private

  def workspace_params
    params.require(:workspace).permit(:title, :address, :price, :recommendation, :workspace_image, :latitude, :longitude)
  end

end
