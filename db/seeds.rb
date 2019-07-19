# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.test?
  places = [
    ["Starbucks", "tea",  "Boston", "description text"],
    ["Dunkin", "coffee", "Concord", "description text"],
  ]
end

if Rails.env.development?
  places = [
    ["McDonalds", "burgers", "Boston", "description text"],
    ["The Coffee Room", "coffee shop", "Newtown", "A warm cozy nook in the heart of Newtown, PA... where you can GET STUFF DONNNNEE"]
  ]

  reviews = [
    ["Pretty good place to study!", "noise level was minimal, wifi was great, plenty of seating but limited outlets", 4, 5, 4, 3, 3, 2, 1]
  ]
end


  # places = [
  #   ["Starbucks", "tea",  "Boston", "description text"],
  #   ["Dunkin", "coffee", "Boston", "description text"],
  #   ["McDonalds", "burgers", "Boston", "description text"],
  #   ["The Coffee Room", "coffee shop", "Newtown", "A warm cozy nook in the heart of Newtown, PA... where you can GET STUFF DONNNNEE"]
  # ]

places.each do |place_info|
  name, place_type, location, description = place_info
  Place.create!(name: name, place_type: place_type, location: location, description: description)
end

reviews.each do |review_info|
  title, body, overall_rating, noise_rating, wifi_rating, capacity_rating, outlet_rating, group_max, vote_count = review_info
  Review.create!(title: title, body: body, overall_rating: overall_rating, noise_rating: noise_rating, wifi_rating: wifi_rating, capacity_rating: capacity_rating, outlet_rating: outlet_rating, group_max: group_max, vote_count: vote_count)
end
