require 'rails_helper'

RSpec.feature "Truck Profile", type: :feature do

  context 'Going to website' do
   Steps 'Being welcomed' do
     Given 'I am trying to visit the trucks page' do
       visit '/trucks'
     end
     When 'I fill in email and password fields' do
       click_link 'Register'
       fill_in 'Email', with: 'food02@gmail.com'
       fill_in 'Password', with: 'federico'
       fill_in 'Password confirmation', with: 'federico'
       click_button 'Sign up'
     end

     Given 'I am trying to visit the trucks page' do
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
