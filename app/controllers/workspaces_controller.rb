class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:show, :edit, :update, :destroy, :create_favorite, :destroy_favorite]

  def index
    @workspaces = Workspace.all
  end

  def show
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = current_user.workspaces.build(workspace_params)
    if @workspace.save
      redirect_to workspace_path(@workspace), notice: 'ワークスペースが登録されました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @workspace.update(workspace_params)
      redirect_to workspace_path(@workspace), notice: 'ワークスペースが更新されました'
    else
      render :edit
    end
  end

  def destroy
    @workspace.destroy
    redirect_to workspaces_path, notice: 'ワークスペースが削除されました'
  end

  def list
    @q = Workspace.ransack(params[:q])
    @workspaces = if params[:latest]
      @q.result.latest.page(params[:page]).per(10)
    elsif params[:old]
      @q.result.old.page(params[:page]).per(10)
    elsif params[:highest_rated]
      @q.result.highest_rated.page(params[:page]).per(10)
    elsif params[:workspace] && params[:workspace][:tag_ids].present?
      @q.result.joins(:tags).where(tags: { id: params[:workspace][:tag_ids] }).distinct.page(params[:page]).per(10)
    else
      @q.result.latest.page(params[:page]).per(10)
    end
  end

  def create_favorite
    current_user.likes.create(workspace: @workspace)
    redirect_to @workspace, notice: 'ワークスペースをお気に入りに追加しました'
  end

  def destroy_favorite
    current_user.likes.find_by(workspace: @workspace).destroy
    redirect_to @workspace, notice: 'ワークスペースのお気に入りを解除しました'
  end

  def tag_filter
    @tag = Tag.find(params[:tag_id])
    @workspaces = @tag.workspaces.page(params[:page]).per(10)
  end

   def search
    @q = Workspace.where("title like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end

  private

  def set_workspace
    @workspace = Workspace.find(params[:id])
  end

  def workspace_params
    params.require(:workspace).permit(:title, :address, :price, :recommendation, :workspace_image, :latitude, :longitude, :spot_type, tag_ids: [])
  end
end
