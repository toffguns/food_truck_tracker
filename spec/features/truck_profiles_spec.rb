require 'rails_helper'

RSpec.feature "Truck Profile", type: :feature do

  context 'Going to website' do
    Steps 'Being welcomed' do
      Given 'I am trying to visit the trucks page' do
        visit '/trucks'
      end
      When 'I fill in email and password fields' do
        click_link 'Sign Up'
        fill_in 'Email', with:  'food02@gmail.com'
        fill_in 'Password (6 characters minimum)*', with: 'federico'
        fill_in 'Password Confirmation*', with: 'federico'
        click_button 'Sign Up'
      end
      Given 'I am trying to visit the trucks page' do
        visit '/trucks'
      end
      Then 'I can see the list of trucks' do
        expect(page).to have_content('Food Trucks Out Now')
      end
      Then 'I can create a truck profile' do
        click_link 'Profile'
        click_link('Create a New Truck')
        attach_file("Image", Rails.root +  "app/assets/images/facebooklogin.png")
        fill_in 'Name', with: 'Burger Boyz'
        fill_in 'Cuisine', with: 'American'
        fill_in 'Menu', with: 'Burgers Fries  Shakes'
        click_button 'Save Truck'
      end
      And 'I go to my profile page' do
        click_link 'Profile'
      end
      Then 'I can click on the new time and place link' do
        click_link 'Add a Location'
      end
      And 'I create a new time and place for my truck' do
        select '2019', from: 'time_and_place_end_time_1i'
        fill_in 'Street address', with: '3803 Ray St.'
        fill_in 'City', with: "San Diego"
        fill_in 'Zip code', with: "92104"
        fill_in 'State', with: "CA"
        click_button 'Save Location'
      end
      And 'I can visit the truck list page' do
        click_link 'Truck List'
      end
      And 'I can click on the truck name to see the truck details' do
        click_link 'Burger Boyz'
      end
    end
  end
end
