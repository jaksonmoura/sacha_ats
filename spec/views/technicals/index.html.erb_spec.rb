require 'spec_helper'

describe "technicals/index" do
  before(:each) do
    assign(:technicals, [
      stub_model(Technical,
        :name => "Name",
        :nickname => "Nickname",
        :password => "Password",
        :password_digest => "Password Digest"
      ),
      stub_model(Technical,
        :name => "Name",
        :nickname => "Nickname",
        :password => "Password",
        :password_digest => "Password Digest"
      )
    ])
  end

  it "renders a list of technicals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Nickname".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
  end
end
