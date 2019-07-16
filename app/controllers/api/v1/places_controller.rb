require 'pry'
class Api::V1::PlacesController < ApplicationController
  def show
    binding.pry
    render json: Place.find(params[:id])
  end
end
