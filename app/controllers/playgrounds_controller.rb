class PlaygroundsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:address].present?
      @playgrounds = Playground.search_by_address_and_date(" #{params[:address]} #{params[:date]}")
    else
      @playgrounds = Playground.all
    end
    @markers = @playgrounds.map do |playground|
      {
        lat: playground.latitude,
        lng: playground.longitude,
        info_window_html: render_to_string(partial: "playgrounds/info_window", locals: { playground: playground })
      }
    end
  end
end
