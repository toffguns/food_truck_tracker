require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do

  context 'Going to website' do
   Steps 'Being welcomed' do
     Given 'I am on the truck profile page' do
       visit '/trucks'
     end
     Then 'I can see the list of trucks' do
       expect(page).to have_content('Listing Trucks')
     end
     Then 'I can create a truck profile' do
       click_link('New Truck')
       fill_in 'Name', with: 'Burger Boyz'
       fill_in 'Cuisine', with: 'American'
       fill_in 'Menu', with: 'Burgers Fries Shakes'
       expect{click_button('Create Truck')}.to_not raise_error
     end
   end
  end
end
