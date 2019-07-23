# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

reviews = [
  ["Pretty good place to study!", "noise level was minimal, wifi was great, plenty of seating but limited outlets", 4, 5, 4, 3, 3, 2, 1]
]

reviews.each do |review_info|
  title, body, overall_rating, noise_rating, wifi_rating, capacity_rating, outlet_rating, group_max, vote_count = review_info
  Review.create!(title: title, body: body, overall_rating: overall_rating, noise_rating: noise_rating, wifi_rating: wifi_rating, capacity_rating: capacity_rating, outlet_rating: outlet_rating, group_max: group_max, vote_count: vote_count)
end

Place.create!(user_id: 1, name: "Forge",place_type: "Coffee Shop",neighborhood: "Union Square",description: "spacious bakery that serves Intelligensia coffee and ice cream",wifi: true,food: true,outdoor_seating: false,standing_options: true,address: "626 Somerville Ave",city: "Somerville",state: "MA",zip: "02143")
