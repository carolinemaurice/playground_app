class GeocodePlaygroundJob < ApplicationJob
  queue_as :default

  def perform(playground)
    sleep(1)
    localisation=playground.geocode
    playground.update(latitude: localisation.first, longitude: localisation.second)
  end
end
