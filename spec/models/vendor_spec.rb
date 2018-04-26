require 'rails_helper'
describe Vendor, :type => :model do

  describe 'Associations' do
    it { should have_many(:bank_accounts) }
    it { should have_one(:address) }
    it { should have_one(:image) }
    it { should have_many(:products) }
  end

  describe 'Validations' do
    subject { FactoryBot.build(:vendor) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    it 'should be valid with only email' do
      vendor = FactoryBot.build(:vendor, email: 'rordev20@gmail.com')
      expect(vendor.valid?).to eq(true)
    end
  end
end