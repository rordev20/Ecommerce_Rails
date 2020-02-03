require "rails_helper"

RSpec.describe HomeController, :type => :controller do

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

  describe "index" do
    it "should render index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end