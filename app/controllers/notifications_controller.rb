class NotificationsController < ApplicationController
  def create
    @notifications_user = NotificationsUser.find(params[:notifications_user_id])
    @session = Session.find(params[:session_id])
    @notification = Notification.new(notification_params)
    @notification.notifications_user = @notifications_user
    @notification.session = @session
    @notification.save
  end

  def mark_as_read
    @notification = Notification.find(params[:id])
    @notification.status = "Read"
    if @notification.save
      redirect_to notifications_user_path(current_user.notifications_user)
    end
  end

  def mark_as_unread
    @notification = Notification.find(params[:id])
    @notification.status = "Unread"
    if @notification.save
      redirect_to notifications_user_path(current_user.notifications_user)
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:content)
  end
end
