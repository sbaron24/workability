require 'rails_helper'

feature "Places are listed", %Q{
  As a user
  I want to see a list of places
  So that I can decide which place to go
} do

  scenario 'places are listed in order' do
    place1 = Place.create!(name: "Starbucks", place_type: "tea", neighborhood: "Boston", description: "description text")
    place2 = Place.create!(name: "Dunkin", place_type: "coffee", neighborhood: "Boston", description: "description text")
    place3 = Place.create!(name: "McDonalds", place_type: "burgers", neighborhood: "Boston", description: "description text")
    visit '/places'
    expect(page).to have_content("Starbucks")
    expect(page).to have_content("Dunkin")
    expect(page).to have_content("McDonalds")
  end

end
