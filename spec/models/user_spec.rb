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
end
