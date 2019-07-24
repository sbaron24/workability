require 'pry'
class Api::V1::ReviewsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    place = Place.find(params["place_id"])
    render json: place.reviews
  end

  def create
    place = Place.find(params["place_id"])
    review = Review.new(
      title: review_params[:title],
      body: review_params[:body],
      overall_rating: review_params[:overallRating],
      noise_rating: review_params[:noiseRating],
      wifi_rating: review_params[:wifiRating],
      capacity_rating: review_params[:capacityRating],
      outlet_rating: review_params[:outletRating],
      group_max: review_params[:groupMax],
      vote_count: 1
    )
    review.place = place
    review.user = current_user
    if review.save
      render json: review
    else
      render json: {error: "Review could not be saved."}
    end
  end
end

private

def review_params
  params.permit(
    :title,
    :body,
    :overallRating,
    :noiseRating,
    :wifiRating,
    :capacityRating,
    :outletRating,
    :groupMax
  )
end
