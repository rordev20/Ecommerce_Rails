require "rails_helper"

RSpec.describe AddressesController, :type => :controller do

  before (:each) do
    @user = User.create!({
      :username => 'Test User',
      :email => 'user@test.com',
      :password => 'please',
      :password_confirmation => 'please',
      :phone_number => '8390584283' 
      })
    sign_in @user
  end

  describe "edit" do
    it "renders the edit template" do 
      address = FactoryBot.build(:address)
      address.save(validate: false)
      get :edit, params: { id: address.id }
      expect(response).to render_template("edit")
      expect(response.body).to eq ""
    end
  end

  describe "update" do
    it "should update address by given parameter" do 
      address = FactoryBot.build(:address) 
      address.save(validate: false)
      put :update, params: { address: { full_name: 'this is your updated address' }, id: address.id }
      #expect(response.body).to eq ("")
      expect(address.reload.full_name).to eq ("this is your updated address")
    end
  end
end