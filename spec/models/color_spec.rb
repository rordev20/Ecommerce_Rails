require 'rails_helper'

describe Color, :type => :model do
  describe 'Associations' do
    it { is_expected.to have_many(:color_sub_categories) }
    it { is_expected.to have_many(:sub_categories) }
    it { is_expected.to have_many(:products) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end