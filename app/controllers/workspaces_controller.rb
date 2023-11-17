class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:show, :edit, :update, :destroy, :create_favorite, :destroy_favorite]

  def index
    @workspaces = Workspace.all
  end

  def show; end

  def new
    @workspace = Workspace.new
  end

  def edit; end

  def create
    @workspace = current_user.workspaces.build(workspace_params)
    if @workspace.save
      redirect_to workspace_path(@workspace), notice: 'ワークスペースが登録されました'
      notify_nearby_users(@workspace)
    else
      render :new
    end
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
                  elsif params[:comfort_order]
                    @q.result.order_by_comfort.page(params[:page]).per(10)
                  elsif params[:convenience_order]
                    @q.result.order_by_convenience.page(params[:page]).per(10)
                  elsif params[:coziness_order]
                    @q.result.order_by_coziness.page(params[:page]).per(10)
                  elsif params[:ease_of_work_order]
                    @q.result.order_by_ease_of_work.page(params[:page]).per(10)
                  elsif params[:environmental_noise_order]
                    @q.result.order_by_environmental_noise.page(params[:page]).per(10)
                  elsif params[:workspace] && params[:workspace][:tag_ids].present?
                    tag_ids = params[:workspace][:tag_ids]
                    @q.result.joins(:tags).where(tags: { id: tag_ids }).group('workspaces.id').having("COUNT(tags.id) = #{tag_ids.size}").page(params[:page]).per(10)
                  else
                    @q.result.page(params[:page]).per(10)
                  end
  end


  def tag_filter
    if params[:workspace].blank? || params[:workspace][:tag_ids].blank?
      flash[:alert] = "少なくとも1つのタグを選択してください。"
      redirect_to list_workspaces_path and return
    end

    @q = Workspace.ransack(params[:q])
    if params[:workspace] && params[:workspace][:tag_ids].present?
      tag_ids = params[:workspace][:tag_ids]
      @workspaces = @q.result
        .joins(:tags)
        .where(tags: { id: tag_ids })
        .group('workspaces.id')
        .having("COUNT(tags.id) = #{tag_ids.size}")
        .page(params[:page])
        .per(10)
    else
      @workspaces = @q.result
    end
    @workspaces_count = @workspaces.to_a.size
  end

  def search
    @q = Workspace.where("title like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end

  def search_result
    @q = Workspace.ransack(params[:q])
    @workspaces = @q.result.page(params[:page]).per(10)
    @workspaces_count = @workspaces.count
    @search_keyword = params[:q][:title_cont] if params[:q] && params[:q][:title_cont].present?
  end

  private

  def set_workspace
    @workspace = Workspace.find(params[:id])
  end

  def workspace_params
    params.require(:workspace).permit(:title, :address, :price, :recommendation, :workspace_image, :latitude, :longitude, :spot_type, tag_ids: [])
  end

  # Geocoder::Calculationsを使用して地理空間計算を行う

  def notify_nearby_users(workspace)
    center_point = [workspace.latitude, workspace.longitude]
    nearby_users = User.all # すべてのユーザーを取得（実際のデータベースクエリを適用してください）

    nearby_users.each do |user|
      user_point = [user.latitude, user.longitude]

      # find the distance between the workspace and the user
      distance_in_km = Geocoder::Calculations.distance_between(center_point, user_point, units: :km)

      # ここでdistance_in_kmを使用して必要な処理を行う
      if distance_in_km <= 5
        ActionCable.server.broadcast(
          "workspace_notifications_channel_user_#{user.id}",
          { message: '近くに新しいワークスペースが登録されました', user_id: user.id }
        )
         Rails.logger.info("ユーザーID #{user.id} に通知を送信しました。距離: #{distance_in_km} km")
      end
    end
  end

end
