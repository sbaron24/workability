require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.new(first_name: "Ashley", last_name: "Hampson", email: "Ashley.Hampson@gmail.com", password: "password") }

  describe 'validations for a user' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
end
