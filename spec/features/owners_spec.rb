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
         click_button 'Sign Up'
      end
      And 'I can see my email address' do
        expect(page).to have_content "food01@gmail.com"
      end
      Then 'I can click on the \"Create a New Truck\" button' do
        click_link 'Create a New Truck'
      end
      Then 'I can create a new truck' do
        fill_in 'Name', with: 'Tasty Tacos'
        fill_in 'Cuisine', with: 'fish'
        fill_in 'Menu', with: 'barbacoa'
        click_button 'Save Truck'
      end
      And 'I can go to my profile page' do
        click_link 'Profile'
      end
      And 'click on the Edit Owner button' do
        click_link 'Edit Owner'
      end
      And 'I can fill in the fields to change the email and password' do
        fill_in 'Email', with: 'asdf@asdf.com'
        fill_in 'Password (leave blank if you don\'t want to change it)', with: 'qwerqwer'
        fill_in 'Password confirmation', with: 'qwerqwer'
        fill_in 'Current password (we need your current password to confirm your changes)', with: 'federico'
        click_button 'Update'
      end
      Then 'I can logout' do
        click_link 'Log Out'
      end
      And 'click the login link' do
        click_link 'Log In'
      end
      And 'enter the new account information' do
        fill_in 'Email', with: 'asdf@asdf.com'
        fill_in 'Password', with: 'qwerqwer'
      end
      And 'click the login button' do
        click_button 'Log In'
        expect(page).to have_content 'Signed in successfully'
      end
    end
  end
end
