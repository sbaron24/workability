require 'pry'
class Api::V1::ReviewsController < ApplicationController
  def index
    render json: Review.all
  end

  def show
    render json: Place.find(params[:id])
  end

  def create
    render json: Review.new(review_params)
  end
end


private

def review_params
  params.require(:review).permit(:title, :body)
end
