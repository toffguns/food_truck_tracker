class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_owner!, except: [:index, :show]

  # GET /trucks
  # GET /trucks.json
  def index
    @trucks = Truck.all
    @time_and_places = TimeAndPlace.where("end_time > ?", DateTime.now).where("start_time < ?", DateTime.now)
  end

  # GET /trucks/1
  # GET /trucks/1.json
  def show
    @reviews = Review.where(truck_id: @truck)
    @review = Review.new

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  # GET /trucks/new
  def new
    @truck = Truck.new
  end

  # GET /trucks/1/edit
  def edit
  end

  # POST /trucks
  # POST /trucks.json
  def create
    @truck = Truck.new(truck_params)

    respond_to do |format|
      if @truck.save
        format.html { redirect_to @truck.owner, notice: 'Truck was successfully created.' }
        format.json { render :show, status: :created, location: @truck }
      else
        format.html { render :new }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trucks/1
  # PATCH/PUT /trucks/1.json
  def update
    respond_to do |format|
      if @truck.update(truck_params)
        format.html { redirect_to @truck, notice: 'Truck was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck }
      else
        format.html { render :edit }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    @truck.destroy
    respond_to do |format|
      format.html { redirect_to trucks_url, notice: 'Truck was successfully removed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck
      @truck = Truck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_params
      params.require(:truck).permit(:name, :cuisine, :menu, :owner_id, :image, :comment, :rating)
    end

end
