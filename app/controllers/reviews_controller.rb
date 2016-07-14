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
    @review.contributor_id = current_contributor.id
    @review.truck_id = @truck.id

    @truck_reviews = Review.where(truck_id: @truck.id)

    # Check to see if contributor has already left a review for the truck and
    # if so destroy the review
    @truck_reviews.each do |review|
      if review.contributor_id == current_contributor.id
        review.destroy
      end
    end

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
