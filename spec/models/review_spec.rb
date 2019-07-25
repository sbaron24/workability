require "rails_helper"

RSpec.describe Review, type: :model do
  let!(:user) { User.new(first_name: "Ashley", last_name: "Hampson", email: "Ashley.Hampson@gmail.com", password: "password", role: "member") }

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

  let!(:review) {Review.create!(
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

  describe 'validations for a review' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:overall_rating) }
    it { should validate_presence_of(:noise_rating) }
    it { should validate_presence_of(:wifi_rating) }
    it { should validate_presence_of(:capacity_rating) }
    it { should validate_presence_of(:outlet_rating) }
    it { should validate_presence_of(:group_max) }
  end

  describe "#user" do
    it "should return user that review belongs to" do
      expect(review.user).to be user
    end
  end

  describe "#place" do
    it "should return place that review belongs to" do
      expect(review.place).to be place
    end
  end
end
