require 'rails_helper'

RSpec.feature "Owners", type: :feature do
  context 'logging in and profile page' do
    Steps 'for logging into the app and going to the profile page' do
      Given 'that I am on the landing page' do
        visit '/'
      end
      Then 'I can click on the sign up button' do
        click_link 'Register'
      end
      And 'I fill in email and password fields' do
        fill_in 'Email', with: 'food01@gmail.com'
        fill_in 'Password', with: 'federico'
        fill_in 'Password confirmation', with: 'federico'
      end
      And 'I submit the information' do
         click_button 'Sign up'
      end
      Then 'I can click on the profile link' do
        click_link 'Profile'
      end
      And 'I can see my email address' do
        expect(page).to have_content "food01@gmail.com"
      end
      Then 'I can create a new truck' do
        fill_in 'Name', with: 'Tasty Tacos'
        fill_in 'Cuisine', with: 'fish'
        fill_in 'Menu', with: 'barbacoa'
        click_button 'Create Truck'
      end
    end
  end
end
