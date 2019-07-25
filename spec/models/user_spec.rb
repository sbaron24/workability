require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.new(first_name: "Ashley", last_name: "Hampson", email: "Ashley.Hampson@gmail.com", password: "password", role: "member") }
  let!(:user_admin) { User.new(first_name: "Ashley", last_name: "Hampson", email: "Ashley.Hampson@gmail.com", password: "password", role: "admin") }

  describe 'validations for a user' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe "#admin?" do
    it "is not an admin if the role is not admin" do
      expect(user.admin?).to eq(false)
    end

    it "is an admin if the role is admin" do
      expect(user_admin.admin?).to eq(true)
    end
  end

  describe "should return reviews created by user" do

    let!(:place) {Place.create(
      user: user,
      name: "Forge",
      place_type: "Coffee Shop",
      neighborhood: "Union Square",
      description: "spacious bakery that serves Intelligensia coffee and ice cream",
      wifi: true,
      food: true,
      outdoor_seating: false,
      standing_options: true,
      address: "626 Somerville Ave",
      city: "Somerville",
      state: "MA",
      zip: "02143"
    )}

    let!(:review1) {Review.create!(
      title: "Great coffee!!!! Also tasty vegan cookies :)",
      body: "I like this place mainly for the coffee and cookiesssss. They have fairly consistent wifi and great seating as well.",
      overall_rating: 3,
      noise_rating: 5,
      wifi_rating: 3,
      capacity_rating: 5,
      outlet_rating: 4,
      group_max: 1,
      user: user,
      place: place
    )}

    let!(:review2) {Review.create!(
      title: "Ehhhhhh good place to study!",
      body: "noise level was quiet, wifi was okay, plenty of seating but also plenty of outlets",
      overall_rating: 3,
      noise_rating: 5,
      wifi_rating: 3,
      capacity_rating: 5,
      outlet_rating: 4,
      group_max: 1,
      user: user,
      place: place
    )}

    it "should return reviews created by user" do
      expect(user.reviews.length).to eq 2
      expect(user.reviews[0]["title"]).to eq("Great coffee!!!! Also tasty vegan cookies :)")
      expect(user.reviews[1]["title"]).to eq("Ehhhhhh good place to study!")
    end
  end
end
