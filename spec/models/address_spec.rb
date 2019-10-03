require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:state) }
    it { should belong_to(:country) }
    it { should belong_to(:vendor) }
    it { should belong_to(:address_type) }
  end

  describe 'validations' do
    subject { FactoryBot.build(:address) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:address1) }
    it { should validate_presence_of(:zipcode) }
    it { should validate_presence_of(:city) }
  end
end
