require "rails_helper"

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end

RSpec.describe Api::V1::PlacesController, type: :controller do
  User.destroy_all
  Place.destroy_all
  Review.destroy_all

  describe "GET#show" do
    let!(:user1) {User.create!(
      id: 1,
      first_name: "Jose",
      last_name: "Fine",
      email: "jf@hotmail.com",
      password: "welcome1"
    )}

    let!(:user2) {User.create!(
      id: 2,
      first_name: "Sean",
      last_name: "Nice",
      email: "sn@hotmail.com",
      password: "welcome2"
    )}

    let!(:first_place) { Place.create!(
      name: "Tatte",
      place_type: "Cafe",
      neighborhood: "Back Bay",
      description: "baked goods and coffee!",
      user_id: 2,
      wifi: true,
      food: false,
      outdoor_seating: true,
      standing_options: false,
      address: "234 Beacon St.",
      city: "Boston" ,
      state: "MA" ,
      zip: "02116",
    )}

    let!(:first_review) { Review.create!(
      title: "Pretty good place to study!",
      body: "noise level was minimal, wifi was great, plenty of seating but limited outlets",
      overall_rating: 4,
      noise_rating: 4,
      wifi_rating: 5,
      capacity_rating: 4,
      outlet_rating: 3,
      group_max: 2,
      user: user1,
      place: first_place
    )}

    let!(:second_review) { Review.create!(
      title: "awesome bakery!",
      body: "a bit noisy but lots of outlets and seatings and good croissants",
      overall_rating: 4,
      noise_rating: 2,
      wifi_rating: 4,
      capacity_rating: 5,
      outlet_rating: 5,
      group_max: 4,
      user: user2,
      place: first_place
    )}

    it "should return a place with expected information" do
      get :show, params: {id: first_place.id}
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 1
      expect(returned_json["place"]["name"]).to eq(first_place.name)
      expect(returned_json["place"]["place_type"]).to eq(first_place.place_type)
      expect(returned_json["place"]["neighborhood"]).to eq(first_place.neighborhood)
      expect(returned_json["place"]["description"]).to eq(first_place.description)

      expect(returned_json["place"]["reviews"].length).to eq 2
      expect(returned_json["place"]["reviews"][0]["title"]).to eq(first_review.title)
      expect(returned_json["place"]["reviews"][0]["body"]).to eq(first_review.body)
      expect(returned_json["place"]["reviews"][0]["noise_rating"]).to eq(first_review.noise_rating)
      expect(returned_json["place"]["reviews"][0]["wifi_rating"]).to eq(first_review.wifi_rating)
      expect(returned_json["place"]["reviews"][0]["capacity_rating"]).to eq(first_review.capacity_rating)
      expect(returned_json["place"]["reviews"][0]["outlet_rating"]).to eq(first_review.outlet_rating)
      expect(returned_json["place"]["reviews"][0]["group_max"]).to eq(first_review.group_max)
      expect(returned_json["place"]["reviews"][0]["user_id"]).to eq(first_review.user_id)
      expect(returned_json["place"]["reviews"][0]["place_id"]).to eq(first_review.place_id)

      expect(returned_json["place"]["reviews"][1]["title"]).to eq(second_review.title)
      expect(returned_json["place"]["reviews"][1]["body"]).to eq(second_review.body)
      expect(returned_json["place"]["reviews"][1]["noise_rating"]).to eq(second_review.noise_rating)
      expect(returned_json["place"]["reviews"][1]["wifi_rating"]).to eq(second_review.wifi_rating)
      expect(returned_json["place"]["reviews"][1]["capacity_rating"]).to eq(second_review.capacity_rating)
      expect(returned_json["place"]["reviews"][1]["outlet_rating"]).to eq(second_review.outlet_rating)
      expect(returned_json["place"]["reviews"][1]["group_max"]).to eq(second_review.group_max)
      expect(returned_json["place"]["reviews"][1]["user_id"]).to eq(second_review.user_id)
      expect(returned_json["place"]["reviews"][1]["place_id"]).to eq(second_review.place_id)
    end
  end
end
