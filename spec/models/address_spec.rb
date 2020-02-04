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
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:address1) }
    it { should validate_presence_of(:zipcode) }
    it { should validate_presence_of(:city) }
  end

  it "has a valid factory" do
    expect(FactoryBot.build(:address)).to be_valid
  end

  describe 'check for billing adress and shipping address' do
    it 'billing address is same as shipping address' do
      expect(Address.address_billing_same_as_shipping?('1')).to eq(true)
    end

    it 'billing address is differnt from shipping address' do
      expect(Address.address_billing_same_as_shipping?('2')).to eq(false)
    end
  end
end
