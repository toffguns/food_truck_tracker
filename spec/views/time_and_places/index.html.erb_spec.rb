require 'rails_helper'

RSpec.describe "time_and_places/index", type: :view do
  before(:each) do
    assign(:time_and_places, [
      TimeAndPlace.create!(
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zip_code => "Zip Code"
      ),
      TimeAndPlace.create!(
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zip_code => "Zip Code"
      )
    ])
  end

  it "renders a list of time_and_places" do
    render
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
  end
end
