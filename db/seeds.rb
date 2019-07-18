# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

if Rails.env.development?
  places = [
    ["McDonalds", "burgers", "Boston", "description text"],
    ["The Coffee Room", "coffee shop", "Newtown", "A warm cozy nook in the heart of Newtown, PA... where you can GET STUFF DONNNNEE"]
  ]
end

places.each do |place_info|
  name, place_type, location, description = place_info
  Place.create!(name: name, place_type: place_type, location: location, description: description)
end
