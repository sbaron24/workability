require 'rails_helper'

feature "Places are listed", %Q{
  As a user
  I want to see a list of places
  So that I can decide which place to go
} do

  scenario 'places are listed in order' do
    place = Place.create!(name: "Starbucks", place_type: "tea", location: "Boston", description: "description text")

    visit '/places'
    expect(page).to have_content("Starbucks")
  end

end
