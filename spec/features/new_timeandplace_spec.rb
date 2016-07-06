require 'rails_helper'

RSpec.feature "TimeAndPlace", type: :feature do
  context 'new TimeAndPlace' do
    Steps 'creating a new TimeAndPlace for a food truck' do
      Given 'I go to the new TimeAndPlace form' do
        visit 'time_and_places/new'
      end
      Then 'I can fill in the form' do
        fill_in 'Street address', with: "12345 main street"
        fill_in 'City', with: "San Diego"
        fill_in 'Zip code', with: "12345"
        fill_in 'State', with: "CA"
      end
      And 'I can click the create instance button' do
        click_button "Create Time and place"
      end
    end
  end
end
