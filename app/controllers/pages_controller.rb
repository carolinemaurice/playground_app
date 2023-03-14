class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
  end

  def mysessions
    @sessions_incomming = current_user.sessions.incoming
    @sessions_finished = current_user.sessions.historic
  end
end
