require 'rails_helper'

RSpec.feature "Owners", type: :feature do
  before (:each) do
    Truck.delete_all
    Owner.delete_all
  end
  context 'logging in and profile page' do
    Steps 'for logging into the app and going to the profile page' do
      Given 'that I am on the landing page' do
        visit '/'
      end
      Then 'I can click on the sign up button' do
        click_link 'Sign Up'
      end
      And 'I fill in email and password fields' do
        @email = Time.now.hour.to_s + Time.now.min.to_s + Time.now.sec.to_s + 'food01@gmail.com'
        fill_in 'Email', with: @email
        fill_in 'Password (6 characters minimum)*', with: 'federico'
        fill_in 'Password Confirmation*', with: 'federico'
      end
      And 'I submit the information' do
         click_button 'Sign Up'
      end
      And 'I can see my email address' do
        expect(Owner.all.size).to eq 1 # should only have one owner at this point

        expect(page).to_not have_content "Email has already been taken"
        expect(page).to have_content "food01@gmail.com"
      end
      Then 'I can click on the \"Create a New Truck\" button' do
        click_link 'Create a New Truck'
      end
      Then 'I can create a new truck' do
        attach_file("Image", Rails.root + "app/assets/images/facebooklogin.png")
        fill_in 'Name', with: 'shrimp blimp'
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
        fill_in 'Email', with: "change" + @email
        fill_in 'Password', with: 'qwerqwer'
        fill_in 'Password confirmation', with: 'qwerqwer'
        fill_in 'Current password', with: 'federico'
        click_button 'Update'
      end
      Then 'I get confirmation' do
        expect(Owner.all.size).to eq 1
        expect(page).to have_content('Your account has been updated successfully.')
      end
      Then 'I can logout' do
        click_link 'Log Out'
      end
      And 'click the login link' do
        click_link 'Log In'
      end
      And 'enter the new account information' do
        expect(Owner.all.size).to eq 1
        fill_in 'Email', with: "change"+@email
        fill_in 'Password', with: 'qwerqwer'
      end
      And 'click the login button' do
        click_button 'Log In'
        expect(page).to have_content 'Signed in successfully'
      end
    end
  end
end
