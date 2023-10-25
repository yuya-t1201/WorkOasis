class WorkspacesController < ApplicationController
  def index
    @workspaces = Workspace.all
  end

  def show
    @workspace = Workspace.find(params[:id])
  end

  def new
    @workspace = Workspace.new
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

  def edit
    @workspace = Workspace.find(params[:id])
  end

  def update
    @workspace = Workspace.find(params[:id])
    if @workspace.update(workspace_params)
      redirect_to workspace_path(@workspace), notice: 'ワークスペースが更新されました'
    else
      render :edit
    end
  end

  def destroy
    @workspace = Workspace.find(params[:id])
    @workspace.destroy
    redirect_to workspaces_path, notice: 'ワークスペースが削除されました'
  end

  def list
    if params[:latest]
      @workspaces = Workspace.latest.page(params[:page]).per(10)
    elsif params[:old]
      @workspaces = Workspace.old.page(params[:page]).per(10)
    elsif params[:highest_rated]
      @workspaces = Workspace.highest_rated.page(params[:page]).per(10)
    elsif params[:workspace] && params[:workspace][:tag_ids].present?
      @workspaces = Workspace.joins(:tags).where(tags: { id: params[:workspace][:tag_ids] }).distinct.page(params[:page]).per(10)
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

  def tag_filter
    @tag = Tag.find(params[:tag_id])
    @workspaces = @tag.workspaces.page(params[:page]).per(10)
  end

  private

  def workspace_params
    params.require(:workspace).permit(:title, :address, :price, :recommendation, :workspace_image, :latitude, :longitude, :spot_type, tag_ids: [])
  end
end
