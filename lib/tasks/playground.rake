namespace :playground do
  desc "Geocode all playgrounds"
  task geocode_all: :environment do
    playgrounds = Playground.all
    puts "Geocoding of all playgrounds starts..."
    playgrounds.each do |playground|
      GeocodePlaygroundJob.perform_now(playground)
      puts "Geocode #{playground.name}"
    end
  end
end
