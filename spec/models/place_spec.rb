require 'rails_helper'

RSpec.describe Place, type: :model do

  let!(:user) { User.create!(first_name: "Ashley", last_name: "Hampson", email: "Ashley.Hampson@gmail.com", password: "password", role: "member") }

  let!(:place) {Place.create!(
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

  describe 'validations for place' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:place_type)}
    it { should validate_presence_of(:neighborhood)}
    it { should validate_presence_of(:description)}
    it { should validate_inclusion_of(:wifi).in_array([true, false]) }
    it { should validate_inclusion_of(:food).in_array([true, false]) }
    it { should validate_inclusion_of(:standing_options).in_array([true, false]) }
    it { should validate_inclusion_of(:outdoor_seating).in_array([true, false]) }
    it { should validate_presence_of(:address)}
    it { should validate_presence_of(:city)}
    it { should validate_presence_of(:state)}
    it { should validate_presence_of(:zip)}
    it { should validate_presence_of(:group_capacity)}
    it { should validate_presence_of(:overall_workability)}
  end

  describe "#init" do
    it "should properly sets initial values" do
    expect(place["group_capacity"]).to eq 1
    expect(place["overall_workability"]).to eq 0
    end
  end

  describe "#self.place_type" do
    it "should return an array greater than length of 1" do
    expect(Place.place_type).to be_instance_of Array
    expect(Place.place_type.length).to be > 0
    end
  end

  describe "#self.neighborhoods" do
    it "should return an array greater than length of 1" do
    expect(Place.neighborhoods).to be_instance_of Array
    expect(Place.neighborhoods.length).to be > 0
    end
  end

  describe "should return reviews created by user" do
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

    it "should return many reviews of a place" do
      expect(place.reviews.length).to eq 2
      expect(place.reviews[0]["title"]).to eq("Great coffee!!!! Also tasty vegan cookies :)")
      expect(place.reviews[1]["title"]).to eq("Ehhhhhh good place to study!")
    end

    it "should return user that belongs to place" do
      expect(place.user).to be user
      expect(place.user["first_name"]).to eq("Ashley")
    end
  end


end
