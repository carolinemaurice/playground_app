class SessionsController < ApplicationController
  before_action :set_playground, only: %i[new create]

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
    @session = Session.find(params[:id])
    @session.destroy
    redirect_to mysessions_path , status: :see_other
  end

  private

  def set_playground
    @playground = Playground.find(params[:playground_id])
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
