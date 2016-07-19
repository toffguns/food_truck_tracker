class TimeAndPlacesController < ApplicationController
  before_action :set_time_and_place, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_owner!, except: [:show, :index]

  def index
    redirect_to '/'
  end
  # GET /time_and_places/1
  # GET /time_and_places/1.json
  def show
  end

  # GET /time_and_places/new
  def new
    @time_and_place = TimeAndPlace.new
    @time_and_place.truck = Truck.find(params[:truck_id])
  end

  # GET /time_and_places/1/edit
  def edit
  end

  # POST /time_and_places
  # POST /time_and_places.json
  def create
    @time_and_place = TimeAndPlace.new(time_and_place_params)

    # create path for page to be rendered if save is successful
    new_path = '/trucks/' + @time_and_place.truck_id.to_s

    respond_to do |format|
      if @time_and_place.save
        format.html { redirect_to new_path, notice: 'Location was successfully saved.' }
        format.json { render :show, status: :created, location: @time_and_place }
      else
        format.html { render :new }
        format.json { render json: @time_and_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_and_places/1
  # PATCH/PUT /time_and_places/1.json
  def update
    new_path = '/trucks/' + @time_and_place.truck_id.to_s
    respond_to do |format|
      if @time_and_place.update(time_and_place_params)
        format.html { redirect_to new_path, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_and_place }
      else
        format.html { render :edit }
        format.json { render json: @time_and_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_and_places/1
  # DELETE /time_and_places/1.json
  def destroy
    @truck = Truck.find(@time_and_place.truck_id)
    @time_and_place.destroy
    respond_to do |format|
      format.html { redirect_to @truck, notice: 'Location was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_and_place
      @time_and_place = TimeAndPlace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_and_place_params
      params.require(:time_and_place).permit(:start_time, :end_time, :street_address, :city, :state, :zip_code, :truck_id)
    end
end
