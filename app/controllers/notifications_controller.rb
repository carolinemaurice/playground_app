class NotificationsController < ApplicationController
  def create
    @notifications_user = NotificationsUser.find(params[:notifications_user_id])
    @session = Session.find(params[:session_id])
    @notification = Notification.new(notification_params)
    @notification.notifications_user = @notifications_user
    @notification.session = @session
    @notification.save
  end

  private

  def notification_params
    params.require(:notification).permit(:content)
  end
end
