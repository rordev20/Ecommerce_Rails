require "rails_helper"

RSpec.describe "file" do
  before(:context) do
  	@secret_yml_data = YAML.load_file(file_fixture("secrets.yml"))
  end

  it "check production secret" do
    expect(@secret_yml_data["production"]["secret_key_base"]).to eq("<%= ENV['SECRET_KEY_BASE'] %>")
  end

  it "check production secret" do
    expect(@secret_yml_data["test"]["secret_key_base"]).to eq('dummy')
  end

  it "check production secret" do
    expect(@secret_yml_data["development"]["secret_key_base"]).to eq('dummy')
  end
end