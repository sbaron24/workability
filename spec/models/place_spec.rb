require 'rails_helper'

RSpec.describe Place, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:place_type)}
    it { should validate_presence_of(:neighborhood)}
    it { should validate_presence_of(:description)}
  end
end
