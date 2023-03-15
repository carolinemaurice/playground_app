class SessionsController < ApplicationController
  before_action :set_playground, only: %i[new create]
  before_action :set_session, only: %i[destroy notice_new_player]

  def show
  end

  def create
    @session = Session.new(session_params)
    @session.playground = @playground
    @session.creator = current_user
    if @session.save
      create_chatroom(@session)
      redirect_to mysessions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @session = Session.new
  end

  def destroy
    @session.destroy if @session.creator == current_user
    redirect_to mysessions_path, status: :see_other
  end

  def notice_new_player
    notification = Notification.new
    notifications_user = @session.creator.notifications_user
    notification.notifications_user = notifications_user
    notification.session = @session
    notification.content = "#{current_user.username} has joined your session planned the #{@session.date}."
    if notification.save
      NotificationsUserChannel.broadcast_to(
        notifications_user,
        render_to_string(partial: "notifications/notification", locals: { notification: notification })
      )
      head :ok
    end
  end

  private

  def set_playground
    @playground = Playground.find(params[:playground_id])
  end

  def set_session
    @session = Session.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:date, :minimum_players, :game_type, :comment, :duration)
  end

  def create_chatroom(session)
    chatroom = Chatroom.new
    chatroom.session = session
    chatroom.save
  end
end
