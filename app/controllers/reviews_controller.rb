class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_truck
  before_action :authenticate_contributor!

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review 
    @review.contributor_id = current_contributor.id
    @review.truck_id = @truck.id

    if @review.save
      redirect_to @truck
    else
      render 'new'
    end
  end

  def update
    @review.update(review_params)
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_truck
      @truck = Truck.find(params[:truck_id])
    end

    def review_params
      params.require(:review).permit(:rating)
    end
end
