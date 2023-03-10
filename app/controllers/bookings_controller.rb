class BookingsController < ApplicationController
  def create
    @session = Session.find(params[:session_id])
    @booking = Booking.new
    @booking.session = @session
    @booking.user = current_user
    if @booking.save
      redirect_to "/mysessions", notice: "You joined the session!"
    else
      render @session, notice: "You cannot joined the session!"
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
      redirect_to "/mysessions", notice: "You cannot delete this booking./nThis session is started."
    else
      redirect_to "/mysessions", notice: "You cannot delete this booking./nThis session is finished."
    end
  end

  private

  def retrieve_duration_between_session_and_now(session)
    # obtain date of session in seconds from epoch
    date = session.date.strftime("%s").to_i
    # obtain date of now in seconds from epoch
    date_now = DateTime.now.strftime("%s").to_i
    elapsed_time = date_now - date
    # Convert elapsed_time in minutes
    elapsed_time / 60
  end
end
