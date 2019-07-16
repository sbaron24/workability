require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.new(first_name: "Ashley", last_name: "Hampson", email: "Ashley.Hampson@gmail.com", password: "password") }

  describe "first_name" do
  it "should return the user's first name" do
    expect(user.first_name).to eq("Ashley")
    end
  end

  describe "last_name" do
  it "should return the user's last name" do
    expect(user.last_name).to eq("Hampson")
    end
  end

  describe "email" do
  it "should return the user's email" do
    expect(user.email).to eq("Ashley.Hampson@gmail.com")
    end
  end

  describe "password" do
  it "should return the user's password" do
    expect(user.password.length).to be >= 6
    end
  end
end
