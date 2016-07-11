class LandingPageController < ApplicationController
  skip_before_action :authenticate_owner!
  skip_before_action :authenticate_contributor!

  def index
    @trucks = Truck.all
  end

  def map_location
    @time_and_places = TimeAndPlace.all
    @hash = Gmaps4rails.build_markers(@time_and_places) do |time_and_place, marker|
     marker.lat time_and_place.latitude
     marker.lng time_and_place.longitude
     marker.infowindow "<b><i>"+ time_and_place.truck.name + "</i></b>" + "<b><br> Cuisine:</b> " + time_and_place.truck.cuisine + "<br>" +
     "<b> Menu: </b>" + time_and_place.truck.menu + "<br><br><em>" +
     time_and_place.start_time.strftime("%a %m/%d") + "</em>" + "<b><br> Start Time: </b>" +
      time_and_place.start_time.strftime("%I:%M %p") + "<b><br> End Time: </b>" + time_and_place.end_time.strftime("%I:%M %p")


    end
    render json: @hash.to_json
  end
end
