sean = User.create(
  first_name: "Sean",
  last_name: "Baron",
  email: "seanman77@gmail.com",
  password: "password",
  role: "member"
)

forge = Place.create!(
  user: sean,
  name: "Forge",
  place_type: "Coffee Shop",
  neighborhood: "Union Square",
  description: "spacious bakery that serves Intelligensia coffee and ice cream",
  wifi: true,
  food: true,
  outdoor_seating: false,
  standing_options: true,
  address: "626 Somerville Ave",
  city: "Somerville",
  state: "MA",
  zip: "02143"
)

sean_review1 = Review.create!(
  title: "Great coffee!!!! Also tasty vegan cookies :)",
  body: "I like this place mainly for the coffee and cookiesssss. They have fairly consistent wifi and great seating as well.",
  overall_rating: 3,
  noise_rating: 5,
  wifi_rating: 3,
  capacity_rating: 5,
  outlet_rating: 4,
  group_max: 1,
  user: sean,
  place: forge
)

jay = User.create(
  first_name: "Jay",
  last_name: "Kim",
  email: "jayman77@gmail.com",
  password: "password",
  role: "member"
)

prudential = Place.create!(
  user: jay,
  name: "Prudential Center",
  place_type: "Mall",
  neighborhood: "Union Square",
  description: "spacious bakery that serves Intelligensia coffee and ice cream",
  wifi: true,
  food: true,
  outdoor_seating: false,
  standing_options: true,
  address: "626 Somerville Ave",
  city: "Somerville",
  state: "MA",
  zip: "02143"
)

jay_review2 = Review.create!(
  title: "Ehhhhhh good place to study!",
  body: "noise level was quiet, wifi was okay, plenty of seating but also plenty of outlets",
  overall_rating: 3,
  noise_rating: 5,
  wifi_rating: 3,
  capacity_rating: 5,
  outlet_rating: 4,
  group_max: 1,
  user: jay,
  place: prudential
)

jay_review1 = Review.create!(
  title: "Pretty good place to study!",
  body: "noise level was minimal, wifi was great, plenty of seating but limited outlets",
  overall_rating: 2,
  noise_rating: 4,
  wifi_rating: 5,
  capacity_rating: 4,
  outlet_rating: 3,
  group_max: 3,
  user: jay,
  place: forge
)
