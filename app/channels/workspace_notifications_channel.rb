class WorkspaceNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "workspace_notifications_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
