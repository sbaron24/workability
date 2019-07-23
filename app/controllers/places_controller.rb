class PlacesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
    @place_type = Place.place_type
    @neighborhoods = Place.neighborhoods
  end

  def new
    @place = Place.new
    @place_type = Place.place_type
    @neighborhoods = Place.neighborhoods
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    @place_type = Place.place_type
    @neighborhoods = Place.neighborhoods

    if @place.save
      flash[:notice] = "Place added successfully!"
      redirect_to places_path
    else
      flash.now[:error] = "Please fill out correctly!"
      render :new
    end
  end

  def update
    @place = Place.find(params[:id])
    @place.user = current_user
    @place_type = Place.place_type
    @neighborhoods = Place.neighborhoods
    if @place.update(place_params)
      flash[:notice] = "Edits saved successfully!"
      redirect_to @place
    else
      flash.now[:notice] = "Failed to save edits."
      render :edit
    end
  end

  private

  def place_params
    params.require(:place).permit(
      :name,
      :description,
      :place_type,
      :neighborhood,
      :wifi,
      :food,
      :standing_options,
      :outdoor_seating,
      :group_capacity,
      :overall_workability,
      :address,
      :city,
      :state,
      :zip
    )
  end

  def authorize_user
    if !user_signed_in?
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end
end
