class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :place_type, :neighborhood, :description, :wifi,
  :food, :outdoor_seating, :standing_options, :address, :city, :state, :zip

  has_many :reviews
end
