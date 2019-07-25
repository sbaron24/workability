require 'rails_helper'

feature "Admin can delete a place they created and a place they did not create", %Q{
  As an admin
  I want to delete the place I created and places others created
  So that I can oversee the places that are on the website
} do

  let!(:user) {User.create!(
    id: 1,
    first_name: "Jose",
    last_name: "Fine",
    email: "jf@hotmail.com",
    password: "welcome1",
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

  scenario 'admin is able to delete a place they did not create' do
    place1 = Place.create!(user: user, name: "Forge",place_type: "Coffee Shop",neighborhood: "Union Square",description: "spacious bakery that serves Intelligensia coffee and ice cream",wifi: true,food: true,outdoor_seating: false,standing_options: true,group_capacity: 4.0,address: "626 Somerville Ave",city: "Somerville",state: "MA",zip: "02143")

    sign_in_as(user3)

    visit "/places/#{place1.id}"
    expect(page).to have_content("Edit")

    click_link "Edit"
    expect(page).to have_content("Delete Place")

    click_link "Delete Place"
    expect(page).to have_current_path("/places")
    expect(page).to_not have_content(place1.name)
  end

  scenario 'admin is able to delete a place they did create' do
    place3 = Place.create!(user: user3, name: "Kim's Coffee",place_type: "Coffee Shop",neighborhood: "Brighton",description: "spacious coffee place that also has ice cream",wifi: true,food: true,outdoor_seating: false,standing_options: true,group_capacity: 4.0,address: "626 Florida Ave",city: "Boston",state: "MA",zip: "02142")

    sign_in_as(user3)

    visit "/places/#{place3.id}"
    expect(page).to have_content("Edit")

    click_link "Edit"
    expect(page).to have_content("Delete Place")

    click_link "Delete Place"
    expect(page).to have_current_path("/places")
    expect(page).to_not have_content(place3.name)
  end
end
