require 'rails_helper'

RSpec.describe Vendor, :type => :model do
  it "has a valid factory" do
    expect(build(:vendor)).to be_valid
  end
  it "is not valid without a name"
  it "is not valid without an email"
end