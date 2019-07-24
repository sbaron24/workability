class ReviewsController < ApplicationController
  def index
    @reviews = Review.find(params[:place_id])
end
