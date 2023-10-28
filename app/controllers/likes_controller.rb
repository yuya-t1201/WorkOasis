class LikesController < ApplicationController
  before_action :require_login
  before_action :set_workspace

  def create
    current_user.like(@workspace)
  end

  def destroy
    current_user.unlike(@workspace)
  end

  private

  def set_workspace
    @workspace = Workspace.find(params[:id])
  end

end
