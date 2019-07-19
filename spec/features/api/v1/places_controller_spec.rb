require "rails_helper"

RSpec.describe Api::V1::PlacesController, type: :controller do
  user = FactoryBot.create(:user)
  let!(:first_place) { Place.create!(
    name: "Tatte",
    place_type: "Cafe",
    neighborhood: "Back Bay",
    description: "baked goods and coffee!",
    user_id: 1,
    wifi: true,
    food: false,
    outdoor_seating: true,
    standing_options: false,
    address: "234 Beacon St.",
    city: "Boston" ,
    state: "MA" ,
    zip: "02116",
  )}

  describe "GET#show" do
    it "should return a place" do
      get :show, params: {id: first_place.id}
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 1
      expect(returned_json["place"]["name"]).to eq(first_place.name)
      expect(returned_json["place"]["place_type"]).to eq(first_place.place_type)
      expect(returned_json["place"]["neighborhood"]).to eq(first_place.neighborhood)
      expect(returned_json["place"]["description"]).to eq(first_place.description)
    end
  end
end
