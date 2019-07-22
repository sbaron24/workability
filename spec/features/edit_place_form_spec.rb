require 'rails_helper'

feature "User signs in and edits place with form" do
  let!(:user) {User.create!(
    id: 1,
    first_name: "Jose",
    last_name: "Fine",
    email: "jf@hotmail.com",
    password: "welcome1"
  )}

  scenario 'user fills out form correctly' do
    @place = Place.create!(user: user, name: "Forge",place_type: "Coffee Shop",neighborhood: "Union Square",description: "spacious bakery that serves Intelligensia coffee and ice cream",wifi: true,food: true,outdoor_seating: false,standing_options: true,group_capacity: 4.0,address: "626 Somerville Ave",city: "Somerville",state: "MA",zip: "02143")

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit "/places/#{@place.id}/edit"
    fill_in 'Name', with: 'Chuck E. Cheese'
    fill_in 'Description', with: 'germ time'
    select 'Library', from: 'Type'
    select 'Somerville', from: 'Neighborhood'
    choose 'place_wifi_valuetrue'
    choose 'place_food_valuefalse'
    choose 'place_outdoor_seating_valuetrue'
    choose 'place_standing_options_valuefalse'
    fill_in 'Address', with: '238 Meatball Ave'
    fill_in 'City', with: 'Spaghetti'
    fill_in 'State', with: 'MA'
    fill_in 'Zip', with: '89267'

    click_button 'Edit Place'

    expect(page).to have_content("Edits saved successfully!")
    expect(page).to have_current_path("/places/#{@place.id}")
  end

  scenario 'user does not fill out some fields' do
    @place = Place.create!(user: user, name: "Forge",place_type: "Coffee Shop",neighborhood: "Union Square",description: "spacious bakery that serves Intelligensia coffee and ice cream",wifi: true,food: true,outdoor_seating: false,standing_options: true,group_capacity: 4.0,address: "626 Somerville Ave",city: "Somerville",state: "MA",zip: "02143")

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit "/places/#{@place.id}/edit"
    fill_in 'Name', with: 'Chuck E. Cheese'
    fill_in 'Description', with: ''
    select 'Library', from: 'Type'
    choose 'place_wifi_valuetrue'
    choose 'place_food_valuefalse'
    choose 'place_outdoor_seating_valuetrue'
    fill_in 'Address', with: '238 Meatball Ave'
    fill_in 'City', with: 'Spaghetti'
    fill_in 'State', with: 'MA'
    fill_in 'Zip', with: '89267'

    click_button 'Edit Place'

    expect(page).to have_content("Failed to save edits.")
  end

  scenario 'user navigates to place edit form' do
    @place = Place.create!(user: user, name: "Forge",place_type: "Coffee Shop",neighborhood: "Union Square",description: "spacious bakery that serves Intelligensia coffee and ice cream",wifi: true,food: true,outdoor_seating: false,standing_options: true,group_capacity: 4.0,address: "626 Somerville Ave",city: "Somerville",state: "MA",zip: "02143")

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit "/places/#{@place.id}"
    click_link 'Edit'
    expect(page).to have_current_path("/places/#{@place.id}/edit")
  end
end
