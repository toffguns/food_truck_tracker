require 'rails_helper'

RSpec.feature "TimeAndPlace", type: :feature do
  context 'new TimeAndPlace' do
    Steps 'creating a new TimeAndPlace for a food truck' do
      Given 'I register as an owner' do
        visit '/'
        click_link 'Register'
        fill_in 'Email', with: 'food02@gmail.com'
        fill_in 'Password', with: 'federico'
        fill_in 'Password confirmation', with: 'federico'
        click_button 'Sign up'
      end
      Then 'I create a new truck' do
        click_link 'List of Food Trucks'
        click_link 'New Truck'
        fill_in 'Name', with: 'Al\'s possum truck'
        fill_in 'Cuisine', with: 'backwood bbq'
        fill_in 'Menu', with: 'possum squirrel racoon'
        click_button 'Create Truck'
      end
      Then 'I can click on the truck\'s show page' do
        click_link 'Show'
      end
      And 'I create a new time and place for my truck' do
        fill_in 'Street address', with: '3803 Ray St.'
        fill_in 'City', with: "San Diego"
        fill_in 'Zip code', with: "92104"
        fill_in 'State', with: "CA"
        click_button 'Create Time and place'
      end
      Then 'I will be directed to my trucks profile page' do
        expect(page).to have_content 'Al\'s possum truck'
      end
    end
  end
end
