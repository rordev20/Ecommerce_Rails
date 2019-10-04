require 'rails_helper'
RSpec.describe Product, type: :model do
  describe 'associations' do
    it { should belong_to(:vendor) }
    it { should belong_to(:sub_category) }
    it { should have_many(:images) }
    it { should have_many(:cart_items) }
    it { should have_many(:carts) }
    it { should have_many(:product_attributes) }
    it { should belong_to(:color) }
    it { should have_many(:product_sizes) }
    it { should have_many(:sizes) }
  end

  describe 'validations' do
    subject { FactoryBot.build(:product) }
    it { should validate_presence_of(:quantity) }
    #it { should validate_uniqueness_of(:name) }
  end

  describe 'scopes' do
  end
end