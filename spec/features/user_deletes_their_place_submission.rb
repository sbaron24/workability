require 'rails_helper'

feature "Authenticated user can delete the place they created", %Q{
  As a authenticated user
  I want to delete the place I created
  So that I can get rid of a duplicate place or place that no longer exists
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

  scenario 'authenticated user is able to delete a place they created' do
    place1 = Place.create!(user: user, name: "Forge",place_type: "Coffee Shop",neighborhood: "Union Square",description: "spacious bakery that serves Intelligensia coffee and ice cream",wifi: true,food: true,outdoor_seating: false,standing_options: true,group_capacity: 4.0,address: "626 Somerville Ave",city: "Somerville",state: "MA",zip: "02143")

    sign_in_as(user)

    visit "/places/#{place1.id}"
    expect(page).to have_content("Edit")

    click_link 'Edit'
    expect(page).to have_current_path("/places/#{place1.id}/edit")
    expect(page).to have_content("Delete Place")

    click_link "Delete Place"
    expect(page).to have_current_path("/places")
    expect(page).to_not have_content(place1.name)
  end
end
