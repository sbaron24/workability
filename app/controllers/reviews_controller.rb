class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @place = Place.new
    @place_type = Place.place_type
    @locations = Place.locations
  end

  def create
    @place = Place.new(review_params)
    @place_type = Place.place_type
    @locations = Place.locations

    if @place.save
      flash[:notice] = "Place added successfully!"
      redirect_to places_path
    else
      flash.now[:error] = "Please fill out correctly!"
      render :new
    end
  end
end

  private

  def review_params
    params.require(:review).permit(:title, :body, :overall_rating, :noise_rating, :wifi_rating, :capacity_rating, :outlet_rating, :group_max, :vote_count)
  end
