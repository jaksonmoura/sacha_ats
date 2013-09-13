require 'spec_helper'

describe "calls/index" do
  before(:each) do
    assign(:calls, [
      stub_model(Call,
        :dpto_id => 1,
        :servant_id => 2,
        :technical_id => 3,
        :equipment => "Equipment",
        :problem => "Problem",
        :service => "Service",
        :obs => "Obs",
        :closed => false
      ),
      stub_model(Call,
        :dpto_id => 1,
        :servant_id => 2,
        :technical_id => 3,
        :equipment => "Equipment",
        :problem => "Problem",
        :service => "Service",
        :obs => "Obs",
        :closed => false
      )
    ])
  end

  it "renders a list of calls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Equipment".to_s, :count => 2
    assert_select "tr>td", :text => "Problem".to_s, :count => 2
    assert_select "tr>td", :text => "Service".to_s, :count => 2
    assert_select "tr>td", :text => "Obs".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
