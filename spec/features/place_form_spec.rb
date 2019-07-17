require 'rails_helper'

feature "User adds new page form" do
  # As a Workability user
  # I want to add the name of a new venue
  # So that I can share my review and new location.

  # Acceptance Criteria:

  # * When I type my name in the field

  scenario 'user fills out form correctly' do
    visit '/places/new'
    fill_in 'Name', with: 'Chuck E. Cheese'
    fill_in 'Description', with: 'germ time'
    select 'Library', from: 'Type'
    select 'Somerville', from: 'Location'
    click_button 'Add a Place'
    Place.create!(name: "Chuck E. Cheese", description: "germ time", place_type: "Library", location: "Somerville")
    visit '/places'
    
    expect(page).to have_content("Chuck E. Cheese")
    expect(page).to have_content("Somerville")
  end

  scenario 'user does not fill out a name' do
    visit '/places/new'
    fill_in 'Description', with: 'Very nice place'
    select 'Museum', from: 'Type'
    select 'Boston', from: 'Location'
    click_button 'Add a Place'

    expect(page).to have_content("Please fill out correctly!")
  end

  scenario 'user does not fill out a description' do
    visit '/places/new'
    fill_in 'Name', with: 'Museum of Science'
    select 'Museum', from: 'Type'
    select 'Boston', from: 'Location'
    click_button 'Add a Place'

    expect(page).to have_content("Please fill out correctly!")
  end

  scenario 'user does not select a type' do
    visit '/places/new'
    fill_in 'Name', with: 'Museum of Science'
    fill_in 'Description', with: 'Very nice place'
    select 'Boston', from: 'Location'
    click_button 'Add a Place'

    expect(page).to have_content("Please fill out correctly!")
  end

  scenario 'user does not select a location' do
    visit '/places/new'
    fill_in 'Name', with: 'Museum of Science'
    fill_in 'Description', with: 'Very nice place'
    select 'Museum', from: 'Type'
    click_button 'Add a Place'

    expect(page).to have_content("Please fill out correctly!")
  end
end

# scenario 'add description to form field' do
#   visit '/places/new'
#   fill_in 'Description', with: 'Long waits + Greasy chicken = Bad restaurant review'
#   click_button '+'
#
#   expect(page).to have_content("description: Long waits + Greasy chicken = Bad restaurant review")
# end
