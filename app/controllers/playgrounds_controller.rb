class PlaygroundsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:playground_id].present?
      @playground = Playground.find(params[:playground_id])
      @sessions = @playground.sessions_from(params['date'])
      respond_to do |format|
        format.html # Follow regular flow of Rails
        format.text do
          render partial: "playgrounds/playground_card",
                 locals: { playground: @playground, sessions: @sessions },
                 formats: [:html]
        end
      end
    else
      if params[:address].present?
        @localisation = Geocoder.search(params[:address]).first.coordinates

        @playgrounds = Playground.near(@localisation, 20, unit: 'km')
        @localisation = @localisation.reverse
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
