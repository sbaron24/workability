require "rails_helper"

feature "user adds a place photo when adding a new place" do
  let!(:user) {User.create!(
    id: 1,
    first_name: "Emily",
    last_name: "Kopp",
    email: "ejk@hotmail.com",
    password: "welcome1",
    role: "member"
  )}

  scenario "user uploads a profile photo" do
    sign_in_as(user)

    expect(page).to have_link("Add New Place")
    expect(page).to have_current_path("/")

    click_link 'Add New Place'
    expect(page).to have_current_path("/places/new")

    fill_in 'Name', with: 'Baked by Emily'
    fill_in 'Description', with: 'yummy baked goods'
    select 'Library', from: 'Type'
    select 'Back Bay', from: 'Neighborhood'
    choose 'place_wifi_valuetrue'
    choose 'place_food_valuefalse'
    choose 'place_outdoor_seating_valuetrue'
    choose 'place_standing_options_valuefalse'
    fill_in 'Address', with: '238 Meatball Ave'
    fill_in 'City', with: 'Boston'
    fill_in 'State', with: 'MA'
    fill_in 'Zip', with: '89267'
    attach_file :place_place_photo, "#{Rails.root}/spec/support/images/photo.png"

    click_button 'Add a Place'

    expect(page).to have_content("Place added successfully!")
    expect(page).to have_css("img[src*='photo.png']")
  end
end
