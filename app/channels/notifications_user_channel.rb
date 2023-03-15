class NotificationsUserChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    notifications_user = NotificationsUser.find(params[:id])
    stream_for notifications_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
