require 'rails_helper'

feature "User adds new page form" do

  scenario 'user fills out form correctly' do
    visit '/places/new'
    fill_in 'Name', with: 'Chuck E. Cheese'
    fill_in 'Description', with: 'germ time'
    select 'Library', from: 'Type'
    select 'Somerville', from: 'Neighborhood'
    click_button 'Add a Place'
    Place.create!(name: "Chuck E. Cheese", description: "germ time", place_type: "Library", neighborhood: "Somerville")
    visit '/places'

    expect(page).to have_content("Chuck E. Cheese")
    expect(page).to have_content("Somerville")
  end

  scenario 'user does not fill out a name' do
    visit '/places/new'
    fill_in 'Description', with: 'Very nice place'
    select 'Museum', from: 'Type'
    select 'Boston', from: 'Neighborhood'
    click_button 'Add a Place'

    expect(page).to have_content("Please fill out correctly!")
  end

  scenario 'user does not fill out a description' do
    visit '/places/new'
    fill_in 'Name', with: 'Museum of Science'
    select 'Museum', from: 'Type'
    select 'Boston', from: 'Neighborhood'
    click_button 'Add a Place'

    expect(page).to have_content("Please fill out correctly!")
  end

  scenario 'user does not select a type' do
    visit '/places/new'
    fill_in 'Name', with: 'Museum of Science'
    fill_in 'Description', with: 'Very nice place'
    select 'Boston', from: 'Neighborhood'
    click_button 'Add a Place'

    expect(page).to have_content("Please fill out correctly!")
  end

  scenario 'user does not select a neighborhood' do
    visit '/places/new'
    fill_in 'Name', with: 'Museum of Science'
    fill_in 'Description', with: 'Very nice place'
    select 'Museum', from: 'Type'
    click_button 'Add a Place'

    expect(page).to have_content("Please fill out correctly!")
  end
end
