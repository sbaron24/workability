require 'rails_helper'

feature "Authenticated user can log in add a new place", %Q{
  As a authenticated user
  I want to add a new place
  So that I can share were to go place to go
} do

  let!(:user) {User.create!(
    id: 1,
    first_name: "Jose",
    last_name: "Fine",
    email: "jf@hotmail.com",
    password: "welcome1",
    role: "member"
  )}

  scenario 'authenticated user is able to add a new place' do
    sign_in_as(user)

    expect(page).to have_link("Add New Place")
    expect(page).to have_current_path("/")

    click_link 'Add New Place'
    expect(page).to have_current_path("/places/new")
  end

  scenario 'unauthenticated user is not able to add a new place' do

    expect(page).to_not have_link("Add New Place")
    expect(page).to have_current_path("/")
  end
end
