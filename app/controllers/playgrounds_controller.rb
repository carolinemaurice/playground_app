class PlaygroundsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:playground_id].present?
      @playground = Playground.find(params[:playground_id])
      respond_to do |format|
        format.html # Follow regular flow of Rails
        format.text { render partial: "playgrounds/playground_card", locals: { playground: @playground }, formats: [:html] }
      end
    else

      if params[:address].present?
        @localisation = Geocoder.search(params[:address]).first.coordinates.reverse

        @playgrounds = Playground.search_by_address_and_date(" #{params[:address]} #{params[:date]}")
      else
        @localisation = [1.44, 43.6]
        @playgrounds = Playground.all
      end
      @markers = @playgrounds.geocoded.map do |playground|
        {
          lat: playground.latitude,
          lng: playground.longitude,
          # info_window_html: render_to_string(partial: "playgrounds/info_window", locals: playground),
          marker_html: render_to_string(partial: "marker", locals: { playground: playground})
        }
      end
    end

  end
end
