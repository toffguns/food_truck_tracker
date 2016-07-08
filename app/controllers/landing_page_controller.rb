class LandingPageController < ApplicationController
  skip_before_action :authenticate_owner!
  skip_before_action :authenticate_contributor!

  def index
    @trucks = Truck.all
  end

  def map_location
    @trucks = Truck.find(params[:truck_id])
    @hash = Gmaps4rails.build_markers(@truck) do |truck, marker|
     marker.lat truck.latitude
     marker.lng truck.longitude
     marker.infowindow truck.address
    end
    render json: @hash.to_json
  end
end
