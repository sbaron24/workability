require 'rails_helper'

feature "Authenticated user can edit the place they created", %Q{
  As a authenticated user
  I want to edit the place I created
  So that I can update the place info
} do

  let!(:user) {User.create!(
    id: 1,
    first_name: "Jose",
    last_name: "Fine",
    email: "jf@hotmail.com",
    password: "welcome1",
    role: "member"
  )}
  let!(:user2) {User.create!(
    id: 2,
    first_name: "Amy",
    last_name: "Fine",
    email: "af@hotmail.com",
    password: "password",
    role: "member"
  )}

  let!(:user3) {User.create!(
    id: 3,
    first_name: "Chris",
    last_name: "Fine",
    email: "Cf@hotmail.com",
    password: "password",
    role: "admin"
  )}

  scenario 'authenticated user is able to edit a place they created' do
    place1 = Place.create!(user: user, name: "Forge",place_type: "Coffee Shop",neighborhood: "Union Square",description: "spacious bakery that serves Intelligensia coffee and ice cream",wifi: true,food: true,outdoor_seating: false,standing_options: true,group_capacity: 4.0,address: "626 Somerville Ave",city: "Somerville",state: "MA",zip: "02143")

    sign_in_as(user)

    visit "/places/#{place1.id}"
    expect(page).to have_content("Edit")

    click_link 'Edit'
    expect(page).to have_current_path("/places/#{place1.id}/edit")
  end

  scenario 'authenticated user is not able to edit a place they did not create' do
    place1 = Place.create!(user: user, name: "Forge",place_type: "Coffee Shop",neighborhood: "Union Square",description: "spacious bakery that serves Intelligensia coffee and ice cream",wifi: true,food: true,outdoor_seating: false,standing_options: true,group_capacity: 4.0,address: "626 Somerville Ave",city: "Somerville",state: "MA",zip: "02143")
    place2 = Place.create!(user: user2, name: "Fortissimo",place_type: "Coffee Shop",neighborhood: "Union Square",description: "serves coffee and Portuguese nom noms",wifi: true,food: true,outdoor_seating: false,standing_options: true,group_capacity: 4.0,address: "365 Somerville Ave",city: "Somerville",state: "MA",zip: "02143")

    sign_in_as(user)

    visit "/places/#{place2.id}"
    expect(page).to_not have_content("Edit")
  end

  scenario 'unauthenticated user is not able to edit a place' do
    place1 = Place.create!(user: user, name: "Forge",place_type: "Coffee Shop",neighborhood: "Union Square",description: "spacious bakery that serves Intelligensia coffee and ice cream",wifi: true,food: true,outdoor_seating: false,standing_options: true,group_capacity: 4.0,address: "626 Somerville Ave",city: "Somerville",state: "MA",zip: "02143")

    visit "/places/#{place1.id}"
    expect(page).to_not have_content("Edit")
  end
end
