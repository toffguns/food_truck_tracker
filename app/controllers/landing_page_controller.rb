class LandingPageController < ApplicationController
  skip_before_action :authenticate_owner!
  skip_before_action :authenticate_contributor!

  def index
    @trucks = Truck.all
  end

  def map_location
    @time_and_places = TimeAndPlace.where("end_time > ?", DateTime.now).where("start_time < ?", DateTime.now)
      @hash = Gmaps4rails.build_markers(@time_and_places) do |time_and_place, marker|

          marker.lat time_and_place.latitude
          marker.lng time_and_place.longitude
          marker.infowindow '<b><a href="/trucks/'+ time_and_place.truck.id.to_s + '">'+ time_and_place.truck.name+'</b></a>'  + "<b><br> Cuisine:</b> " + time_and_place.truck.cuisine + "<br>" +
          "<b> Menu: </b>" + time_and_place.truck.menu + "<br><br><em>" +'<b>'+
          time_and_place.start_time.strftime("%a %m/%d") + "</b></em> <br>"'<b>Address: </b>' + time_and_place.street_address + ", " + time_and_place.city + '<br>' "<b><br> Start Time: </b>" + time_and_place.start_time.strftime("%I:%M %p") + '</b>' +"<b><br> End Time: </b>" + time_and_place.end_time.strftime("%I:%M %p")
        end

    render json: @hash.to_json
  end

  def search
    @result = Truck.basic_search(params[:search])
    @time_and_places = []
    @result.each do |truck|
      truck.time_and_places.each do |time_and_place|
        if time_and_place.start_time.past? && time_and_place.end_time.future?
          @time_and_places << time_and_place
        end
      end
    end
    @hash = Gmaps4rails.build_markers(@time_and_places) do |time_and_place, marker|
     marker.lat time_and_place.latitude
     marker.lng time_and_place.longitude
     marker.infowindow "<b><i>"+ time_and_place.truck.name + "</i></b>" + "<b><br> Cuisine:</b> " + time_and_place.truck.cuisine + "<br>" +
     "<b> Menu: </b>" + time_and_place.truck.menu + "<br><br><em>" +
     time_and_place.start_time.strftime("%a %m/%d") + "</em>" + "<b><br> Start Time: </b>" +
      time_and_place.start_time.strftime("%I:%M %p") + "<b><br> End Time: </b>" + time_and_place.end_time.strftime("%I:%M %p")
    end
    render json: @hash.to_json
    # @time_and_places.each do |time_and_place|
    #   if time_and_place.start_time
    #
    #   end
    # end
  end
end
