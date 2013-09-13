require 'spec_helper'

describe "technicals/new" do
  before(:each) do
    assign(:technical, stub_model(Technical,
      :name => "MyString",
      :nickname => "MyString",
      :password => "MyString",
      :password_digest => "MyString"
    ).as_new_record)
  end

  it "renders new technical form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", technicals_path, "post" do
      assert_select "input#technical_name[name=?]", "technical[name]"
      assert_select "input#technical_nickname[name=?]", "technical[nickname]"
      assert_select "input#technical_password[name=?]", "technical[password]"
      assert_select "input#technical_password_digest[name=?]", "technical[password_digest]"
    end
  end
end
