require 'rails_helper'

RSpec.describe "time_and_places/show", type: :view do
  before(:each) do
    @time_and_place = assign(:time_and_place, TimeAndPlace.create!(
      :street_address => "Street Address",
      :city => "City",
      :state => "State",
      :zip_code => "Zip Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip Code/)
  end
end
