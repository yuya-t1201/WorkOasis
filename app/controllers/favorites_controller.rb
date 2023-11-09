class FavoritesController < ApplicationController
  def create
    current_user.likes.create(workspace: Workspace.find(params[:workspace_id]))
    redirect_to Workspace.find(params[:workspace_id]), notice: 'ワークスペースをお気に入りに追加しました'
  end

  def destroy
    current_user.likes.find_by(workspace: Workspace.find(params[:workspace_id])).destroy
    redirect_to Workspace.find(params[:workspace_id]), notice: 'ワークスペースのお気に入りを解除しました'
  end
end
