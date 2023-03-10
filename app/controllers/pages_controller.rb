class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
  end

  def mysessions
    @sessions_incomming = current_user.sessions
    current_user.bookings.each do |booking|
      @sessions_incomming << booking.session
    end

    @sessions_finished = current_user.sessions
    current_user.bookings.each do |booking|
      @sessions_incomming << booking.session
    end
  end

end
