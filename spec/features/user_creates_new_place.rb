require 'rails_helper'

feature "Authenticated user can add a new place", %Q{
  As a authenticated user
  I want to add a new place
  So that I can share were to go place to go
} do

  let!(:user) {User.create!(
    id: 1,
    first_name: "Jose",
    last_name: "Fine",
    email: "jf@hotmail.com",
    password: "welcome1",
    role: "member"
  )}

  scenario 'authenticated use is able to add a new place' do
    place1 = Place.create!(user: user, name: "Forge",place_type: "Coffee Shop",neighborhood: "Union Square",description: "spacious bakery that serves Intelligensia coffee and ice cream",wifi: true,food: true,outdoor_seating: false,standing_options: true,group_capacity: 4.0,address: "626 Somerville Ave",city: "Somerville",state: "MA",zip: "02143")
    place2 = Place.create!(user: user, name: "Fortissimo",place_type: "Coffee Shop",neighborhood: "Union Square",description: "serves coffee and Portuguese nom noms",wifi: true,food: true,outdoor_seating: false,standing_options: true,group_capacity: 4.0,address: "365 Somerville Ave",city: "Somerville",state: "MA",zip: "02143")
    visit '/places'
    expect(page).to have_content("Forge")
    expect(page).to have_content("Fortissimo")

    click_link 'Add New Place'
    expect(page).to have_current_path("/places/new")
  end
end
