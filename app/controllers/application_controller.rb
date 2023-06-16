class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def not_authenticated
    redirect_to new_sessions, danger: "ログインしてください"
end
