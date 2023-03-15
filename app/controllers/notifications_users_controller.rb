class NotificationsUsersController < ApplicationController
  def show
    @notifications_user = NotificationsUser.find(params[:id])
  end
end
