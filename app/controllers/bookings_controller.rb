class BookingsController < ApplicationController
  def create
    @session = Session.find(params[:session_id])
    @booking = Booking.new
    @booking.session = @session
    @booking.user = current_user
    if @booking.session.players.include?(@booking.user)
      redirect_to playgrounds_path, notice: "You have already joined this sessions!"
    else
      if @booking.save
        redirect_to mysessions_path, notice: "You joined the session!"
      else
        redirect_to new_user_session_path
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    # a booking cannot be destroyed 30 minutes before the start of the session
    time_until_start_session = retrieve_duration_between_session_and_now(@booking.session)
    case time_until_start_session
    when (30..)
      @booking.destroy
      redirect_to "/mysessions", status: :see_other
    when (0...30)
      redirect_to "/mysessions", notice: "You cannot delete this booking./nThis session will start in less than 30 minutes."
    when (-@booking.session.duration..0)
      redirect_to "/mysessions", notice: "You cannot delete this booking./nThis session is running."
    else
      redirect_to "/mysessions", notice: "You cannot delete this booking./nThis session is over."
    end
  end

  private

  def retrieve_duration_between_session_and_now(session)
    # obtain date of session in seconds from epoch
    date = session.date.strftime("%s").to_i
    # obtain date of now in seconds from epoch
    date_now = DateTime.now.strftime("%s").to_i
    elapsed_time = date - date_now
    # Convert elapsed_time in minutes
    (elapsed_time / 60) - 60
  end
end
