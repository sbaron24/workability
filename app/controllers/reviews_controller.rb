class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :overall_rating, :noise_rating, :wifi_rating, :capacity_rating, :outlet_rating, :group_max, :vote_count)
  end
