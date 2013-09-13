require 'spec_helper'

describe "calls/show" do
  before(:each) do
    @call = assign(:call, stub_model(Call,
      :dpto_id => 1,
      :servant_id => 2,
      :technical_id => 3,
      :equipment => "Equipment",
      :problem => "Problem",
      :service => "Service",
      :obs => "Obs",
      :closed => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Equipment/)
    rendered.should match(/Problem/)
    rendered.should match(/Service/)
    rendered.should match(/Obs/)
    rendered.should match(/false/)
  end
end
