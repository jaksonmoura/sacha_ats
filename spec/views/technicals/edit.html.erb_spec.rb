require 'spec_helper'

describe "technicals/edit" do
  before(:each) do
    @technical = assign(:technical, stub_model(Technical,
      :name => "MyString",
      :nickname => "MyString",
      :password => "MyString",
      :password_digest => "MyString"
    ))
  end

  it "renders the edit technical form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", technical_path(@technical), "post" do
      assert_select "input#technical_name[name=?]", "technical[name]"
      assert_select "input#technical_nickname[name=?]", "technical[nickname]"
      assert_select "input#technical_password[name=?]", "technical[password]"
      assert_select "input#technical_password_digest[name=?]", "technical[password_digest]"
    end
  end
end
