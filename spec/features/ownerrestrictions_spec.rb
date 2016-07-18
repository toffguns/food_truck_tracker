require 'rails_helper'

RSpec.feature 'Ownerrestrictions', type: :feature do
  # before(:each) do
  #   visit '/'
  # end
  context 'Food truck owner sign up to create content' do
    Steps 'Signing up' do
      Given 'I am on the sign up page' do
        visit '/owners/sign_up'
      end
      Then 'I can see a sign up message' do
        expect(page).to have_content'Sign Up'
      end
      When 'I fill in email and password fields' do
        fill_in 'Email', with: 'food08@gmail.com'
        fill_in 'Password (6 characters minimum)*', with: 'federico'
        fill_in 'Password Confirmation*', with: 'federico'
      end
      And 'I submit the information' do
         click_button 'Sign Up'
      end
      And 'I can see a logout button' do
        expect(page).to have_content'Log Out'
      end
      Then 'I can click the logout button to logout' do
        click_link('Log Out')
      end
      Given 'I am on the sign up page' do
        visit '/owners/sign_up'
      end
      Then 'I can see a log in message' do
        expect(page).to have_content'Sign Up'
      end
      When 'I fill in email and password fields' do
        fill_in 'Email', with: 'food@gmail.com'
        fill_in 'Password (6 characters minimum)*', with: 'federico'
        fill_in 'Password Confirmation*', with: 'federico'
      end
      And 'I submit the information' do
         click_button 'Sign Up'
      end
      Then 'I will be redirect to the landing page' do
        visit '/'
        expect(page).to have_content'Log Out'
      end
      Then 'I can try to go into another owners profile with the url' do
        # Owner.all.each { |owner| p owner}
        visit '/owners/1'
        expect(page).to have_content 'Food Truck'
      end
    end
  end
end
