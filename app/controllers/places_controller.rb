class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

#
#   def self.location
#     @location = ["Boston", "Medford", "Malden"]
#   end

  def new
    @place = Place.new
    @place_type = ['Coffee shop', 'Park', 'Library', 'Museum']
    @location = ['Boston', 'Medford', 'Concord', 'Somerville', 'Brighton']
  end

  def create
    @place = Place.new(place_params)

    if @place.save
      flash[:notice] = "Place added successfully!"
      redirect_to places_path
    else
      flash.now[:error] = @place.errors.full_messages.join(", ")
      render :new
    end
  end

end

  private

  def place_params
    params.require(:place).permit(:name, :description, :place_type, :location)
  end
