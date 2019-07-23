require 'rails_helper'

feature "Admin can edit a place they created and a place they did not create", %Q{
  As an admin
  I want to edit the place I created and places others created
  So that I can oversee the info on the places pages that are on the website
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

  scenario 'admin is able to edit a place they did not create' do
    place1 = Place.create!(user: user, name: "Forge",place_type: "Coffee Shop",neighborhood: "Union Square",description: "spacious bakery that serves Intelligensia coffee and ice cream",wifi: true,food: true,outdoor_seating: false,standing_options: true,group_capacity: 4.0,address: "626 Somerville Ave",city: "Somerville",state: "MA",zip: "02143")

    visit new_user_session_path
    fill_in 'Email', with: user3.email
    fill_in 'Password', with: user3.password
    click_button 'Log in'

    visit "/places/#{place1.id}"
    expect(page).to have_content("Edit")
  end
  scenario 'admin is able to edit a place they did create' do
    place3 = Place.create!(user: user3, name: "Kim's Coffee",place_type: "Coffee Shop",neighborhood: "Brighton",description: "spacious coffee place that also has ice cream",wifi: true,food: true,outdoor_seating: false,standing_options: true,group_capacity: 4.0,address: "626 Florida Ave",city: "Boston",state: "MA",zip: "02142")

    visit new_user_session_path
    fill_in 'Email', with: user3.email
    fill_in 'Password', with: user3.password
    click_button 'Log in'

    visit "/places/#{place3.id}"
    expect(page).to have_content("Edit")
  end

end
