require 'rails_helper'

RSpec.describe "time_and_places/new", type: :view do
  before(:each) do
    assign(:time_and_place, TimeAndPlace.new(
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => "MyString"
    ))
  end

  it "renders new time_and_place form" do
    render

    assert_select "form[action=?][method=?]", time_and_places_path, "post" do

      assert_select "input#time_and_place_street_address[name=?]", "time_and_place[street_address]"

      assert_select "input#time_and_place_city[name=?]", "time_and_place[city]"

      assert_select "input#time_and_place_state[name=?]", "time_and_place[state]"

      assert_select "input#time_and_place_zip_code[name=?]", "time_and_place[zip_code]"
    end
  end
end
