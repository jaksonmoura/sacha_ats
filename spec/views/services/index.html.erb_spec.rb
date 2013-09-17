require 'spec_helper'

describe "services/index" do
  before(:each) do
    assign(:services, [
      stub_model(Service,
        :service => "Service",
        :priority => 1
      ),
      stub_model(Service,
        :service => "Service",
        :priority => 1
      )
    ])
  end

  it "renders a list of services" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Service".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
