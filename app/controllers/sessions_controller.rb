class SessionsController < ApplicationController
  before_action :set_playground, only: %i[new create]

  def show
  end

  def create
    @session = Session.new(session_params)
    @session.playground = @playground
    if @session.save
      redirect_to playground_path(@playground)
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
    redirect_to playground_path(@session.playground), status: :see_other
  end

  private

  def set_playground
    @playground = Playground.find(params[:playground_id])
  end

  def session_params
    params.require(:session).permit(:date, :minimum_players, :game_type, :comment, :duration)
  end
end
