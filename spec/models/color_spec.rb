require 'rails_helper'

describe Color, :type => :model do
  describe 'Associations' do
    it { should have_many(:color_sub_categories) }
    it { should have_many(:sub_categories) }
    it { should have_many(:products) }
  end

  describe 'Validations' do
  	subject { FactoryBot.build(:color) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end