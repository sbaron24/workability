require 'rails_helper'

feature "Admin can log in add a new place", %Q{
  As an admin
  I want to add a new place
  So that I can share were to go place to go
} do

  let!(:user3) {User.create!(
    id: 3,
    first_name: "Chris",
    last_name: "Fine",
    email: "Cf@hotmail.com",
    password: "password",
    role: "admin"
  )}

  scenario 'admin is able to add a new place' do
    visit new_user_session_path
    fill_in 'Email', with: user3.email
    fill_in 'Password', with: user3.password
    click_button 'Log in'

    expect(page).to have_link("Add New Place")
    expect(page).to have_current_path("/")

    click_link 'Add New Place'
    expect(page).to have_current_path("/places/new")
  end

  scenario 'unauthenticated non-admin user is not able to add a new place' do

    expect(page).to_not have_link("Add New Place")
    expect(page).to have_current_path("/")
  end

end
