require 'rails_helper'

RSpec.feature "TimeAndPlace", type: :feature do
  context 'new TimeAndPlace' do
    Steps 'creating a new TimeAndPlace for a food truck' do
      Given 'I go to the new TimeAndPlace for' do
        visit 'time_and_places/new'
      end
      When 'I fill in email and password fields' do
        click_link 'Sign up'
        fill_in 'Email', with: 'food02@gmail.com'
        fill_in 'Password', with: 'federico'
        fill_in 'Password confirmation', with: 'federico'
        click_button 'Sign up'
      end
      Then 'I can fill in the form' do
        fill_in 'time_and_place_street_address', with: "12345 main street"
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
