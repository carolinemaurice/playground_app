class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
  end

  def mysessions
    @sessions_incomming = []
    @sessions_finished = []
    @sessions_incomming = current_user.sessions.incoming
    @sessions_finished = current_user.sessions.historic

    @sessions_incomming += current_user.sessions.to_a
    current_user.bookings.each do |booking|
      @sessions_incomming << booking.session
    end

    @sessions_finished += current_user.sessions.to_a
    current_user.bookings.each do |booking|
      @sessions_finished << booking.session
    end

  end
end
