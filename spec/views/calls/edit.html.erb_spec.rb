require 'spec_helper'

describe "calls/edit" do
  before(:each) do
    @call = assign(:call, stub_model(Call,
      :dpto_id => 1,
      :servant_id => 1,
      :technical_id => 1,
      :equipment => "MyString",
      :problem => "MyString",
      :service => "MyString",
      :obs => "MyString",
      :closed => false
    ))
  end

  it "renders the edit call form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", call_path(@call), "post" do
      assert_select "input#call_dpto_id[name=?]", "call[dpto_id]"
      assert_select "input#call_servant_id[name=?]", "call[servant_id]"
      assert_select "input#call_technical_id[name=?]", "call[technical_id]"
      assert_select "input#call_equipment[name=?]", "call[equipment]"
      assert_select "input#call_problem[name=?]", "call[problem]"
      assert_select "input#call_service[name=?]", "call[service]"
      assert_select "input#call_obs[name=?]", "call[obs]"
      assert_select "input#call_closed[name=?]", "call[closed]"
    end
  end
end
