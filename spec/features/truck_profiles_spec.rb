require 'rails_helper'

RSpec.feature "Truck Profile", type: :feature do

  context 'Going to website' do
    Steps 'Being welcomed' do
      Given 'I am trying to visit the trucks page' do
        visit '/trucks'
      end
      When 'I fill in email and password fields' do
        click_link 'Register'
        fill_in 'Email', with:  'food02@gmail.com'
        fill_in 'Password', with: 'federico'
        fill_in 'Password confirmation', with: 'federico'
        click_button 'Sign Up'
      end
      Given 'I am trying to visit the trucks page' do
        visit '/trucks'
      end
      Then 'I can see the list of trucks' do
        expect(page).to have_content('Listing All Trucks')
      end
      Then 'I can create a truck profile' do
        click_link('Create a New Truck')
        attach_file("Image", Rails.root +  "app/assets/images/facebook2.png")
        fill_in 'Name', with: 'Burger Boyz'
        fill_in 'Cuisine', with: 'American'
        fill_in 'Menu', with: 'Burgers Fries  Shakes'
        click_button 'Save Truck'
      end
      And 'I can visit the truck list page' do
        click_link 'Truck List'
      end
      And 'I can click on the truck name to see the truck details' do
        click_link 'Burger Boyz'
        expect(page).to have_content 'Write a Review or Comment'
      end
    end
  end
end
