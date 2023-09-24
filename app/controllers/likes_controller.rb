class LikesController < ApplicationController
  before_action :require_login

  def create
    workspace = Workspace.find(params[:id])
    current_user.like(workspace)
  end

  def destroy
    workspace = Workspace.find(params[:id])
    current_user.unlike(workspace)
  end

end
