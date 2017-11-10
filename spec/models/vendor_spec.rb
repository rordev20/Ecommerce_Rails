require 'rails_helper'

describe Vendor, :type => :model do
  describe 'Associations' do
    it { is_expected.to have_many(:bank_accounts) }
    it { is_expected.to have_one(:address) }
    it { is_expected.to have_one(:image) }
    it { is_expected.to have_many(:products) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
  end
end