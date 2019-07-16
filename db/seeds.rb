# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  places = [
    ["Starbucks", "tea",  "Boston", "description text"],
    ["Dunkin", "coffee", "Boston", "description text"],
    ["McDonalds", "burgers", "Boston", "description text"],
    ["The Coffee Room", "coffee shop", "Newtown", "A warm cozy nook in the heart of Newtown, PA... where you can GET STUFF DONNNNEE"]
  ]

  places.each do |place_info|
    name, place_type, location, description = place_info
    Place.create!(name: name, place_type: place_type, location: location, description: description)
  end
