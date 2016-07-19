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
      marker.picture ({
      :url => '/assets/truck.png',
      :width => 32,
      :height => 37
      })
      marker.infowindow '<img src="' + time_and_place.truck.image.url(:small) + '"/>' + '<br>' + '<b class="infowindow_truck_name"><a href="/trucks/'+ time_and_place.truck.id.to_s + '">'+ time_and_place.truck.name+'</b></a>'  + "<b><br> Cuisine:</b> " + time_and_place.truck.cuisine + "<br>" +
      "<b> Menu: </b>" + time_and_place.truck.menu + "<br><br><em>" +'<b>'+
      time_and_place.start_time.strftime("%a %m/%d") + "</b></em> <br>"'<b>Address: </b>' + time_and_place.street_address + ", " + time_and_place.city + '<br>' "<b><br> Start Time: </b>" + time_and_place.start_time.strftime("%I:%M %p") + '</b>' +"<b><br> End Time: </b>" + time_and_place.end_time.strftime("%I:%M %p") + '<br>' +
      '<b class="infowindow_link"><a href="/trucks/'+ time_and_place.truck.id.to_s + '">'+ 'More Details</b></a>'
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

    @time_and_places.each do |time_and_place|
      if time_and_place.end_time.past?
        @time_and_places.delete(time_and_place)
      end
    end

    @hash = Gmaps4rails.build_markers(@time_and_places) do |time_and_place, marker|
     marker.lat time_and_place.latitude
     marker.lng time_and_place.longitude

     marker.picture ({
     :url => '/assets/truck.png',
     :width => 32,
     :height => 37
     })
     marker.infowindow '<img src="' + time_and_place.truck.image.url(:small) + '"/>' + '<br>' + '<b><a href="/trucks/'+ time_and_place.truck.id.to_s + '">'+ time_and_place.truck.name+'</b></a>'  + "<b><br> Cuisine:</b> " + time_and_place.truck.cuisine + "<br>" +
     "<b> Menu: </b>" + time_and_place.truck.menu + "<br><br><em>" +'<b>'+
     time_and_place.start_time.strftime("%a %m/%d") + "</b></em> <br>"'<b>Address: </b>' + time_and_place.street_address + ", " + time_and_place.city + '<br>' "<b><br> Start Time: </b>" + time_and_place.start_time.strftime("%I:%M %p") + '</b>' +"<b><br> End Time: </b>" + time_and_place.end_time.strftime("%I:%M %p") + '<br>' +
     '<b class="infowindow_link"><a href="/trucks/'+ time_and_place.truck.id.to_s + '">'+ 'More Details</b></a>'
   end
    render json: @hash.to_json
  end

  def get_markers_by_address
    @time_and_places = []

    # Get time_and_places that are current and within 1 degree of location
    TimeAndPlace.all.each do |time_and_place|
      if (time_and_place.start_time.past? && time_and_place.end_time.future?) && (time_and_place.latitude <= (params[:latitude].to_i + 1) && time_and_place.latitude >= (params[:latitude].to_i - 1)) && (time_and_place.longitude <= (params[:longitude].to_i + 1) && time_and_place.longitude >= (params[:longitude].to_i - 1))
        @time_and_places << time_and_place
      end
    end

    @hash = Gmaps4rails.build_markers(@time_and_places) do |time_and_place, marker|
      marker.lat time_and_place.latitude
      marker.lng time_and_place.longitude
      marker.picture ({
      :url => '/assets/truck.png',
      :width => 32,
      :height => 37
      })
      marker.infowindow '<img src="' + time_and_place.truck.image.url(:small) + '"/>' + '<br>' + '<b class="infowindow_truck_name"><a href="/trucks/'+ time_and_place.truck.id.to_s + '">'+ time_and_place.truck.name+'</b></a>'  + "<b><br> Cuisine:</b> " + time_and_place.truck.cuisine + "<br>" +
      "<b> Menu: </b>" + time_and_place.truck.menu + "<br><br><em>" +'<b>'+
      time_and_place.start_time.strftime("%a %m/%d") + "</b></em> <br>"'<b>Address: </b>' + time_and_place.street_address + ", " + time_and_place.city + '<br>' "<b><br> Start Time: </b>" + time_and_place.start_time.strftime("%I:%M %p") + '</b>' +"<b><br> End Time: </b>" + time_and_place.end_time.strftime("%I:%M %p") + '<br>' +
      '<b class="infowindow_link"><a href="/trucks/'+ time_and_place.truck.id.to_s + '">'+ 'More Details</b></a>'

      end

  
    render json: @hash.to_json
  end

end
