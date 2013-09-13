require 'spec_helper'

describe "technicals/show" do
  before(:each) do
    @technical = assign(:technical, stub_model(Technical,
      :name => "Name",
      :nickname => "Nickname",
      :password => "Password",
      :password_digest => "Password Digest"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Nickname/)
    rendered.should match(/Password/)
    rendered.should match(/Password Digest/)
  end
end
