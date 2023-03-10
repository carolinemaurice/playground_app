class PlaygroundsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:address].present?
      @localisation = Geocoder.search(params[:address]).first.coordinates.reverse

      @playgrounds = Playground.near(params[:address], 10, units: :km)
    else
      @localisation = [1.44, 43.6]
      @playgrounds = Playground.all
    end
    @markers = @playgrounds.geocoded.map do |playground|
      {
        lat: playground.latitude,
        lng: playground.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
end
