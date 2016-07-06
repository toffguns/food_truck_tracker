class LandingPageController < ApplicationController
  def index
    @time_and_places = TimeAndPlace.all #@apartments may also be found using the set_apartment method provided by scaffolding
      @pindrop = Gmaps4rails.build_markers(@time_and_places) do |time_and_place, marker|
        marker.lat time_and_place.latitude
        marker.lng time_and_place.longitude
        marker.infowindow time_and_place.street_address
      end
  end
end
