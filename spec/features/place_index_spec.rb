require 'rails_helper'

feature "Places are listed", %Q{
  As a user
  I want to see a list of places
  So that I can decide which place to go
} do

  # User.destroy_all
  user = FactoryBot.create(:user)

  scenario 'places are listed' do
    place1 = Place.create!(user: user, name: "Forge",place_type: "Coffee Shop",neighborhood: "Union Square",description: "spacious bakery that serves Intelligensia coffee and ice cream",wifi: true,food: true,outdoor_seating: false,standing_options: true,group_capacity: 4.0,address: "626 Somerville Ave",city: "Somerville",state: "MA",zip: "02143")
    place2 = Place.create!(user: user, name: "Fortissimo",place_type: "Coffee Shop",neighborhood: "Union Square",description: "serves coffee and Portuguese nom noms",wifi: true,food: true,outdoor_seating: false,standing_options: true,group_capacity: 4.0,address: "365 Somerville Ave",city: "Somerville",state: "MA",zip: "02143")
    visit '/places'
    expect(page).to have_content("Forge")
    expect(page).to have_content("Fortissimo")
  end

end
